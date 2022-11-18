db = dbConnect("sqlite","dosya/results.db")

local evsiniri = 2
local evler = {}
local markerlar = {}
local alans
local evid
local isinlananlar = { }
local onceki = { }
local px,py,pz
local durum = false

local interiorlar =
	    {
            [1] = {2495.944, -1692.495, 1014.742, 180, 3},
            [2] = {2333.110, -1077.100, 1049.023, 0, 6},
            [3] = {2196.852, -1204.260, 1049.023, 90, 6},
            [4] = {2308.790, -1212.880, 1049.023, 0, 6},
            [5] = {2269.883, -1210.548, 1047.563, 90, 10},
            [6] = {1299.082, -796.762, 1084.008, 0, 5},
            [7] = {2324.354, -1149.102, 1050.710, 0, 12}, 
            [8] = {223.040, 1287.260, 1082.141, 0, 1}, 
            [9] = {226.901, 1239.824, 1082.942, 90, 2},
            [10] = {447.036, 1397.600, 1084.305, 0, 2}, 
            [11] = {491.227, 1398.246, 1081.016, 0, 2},
            [12] = {235.296, 1187.134, 1080.258, 0, 3}, 
            [13] = {-260.600, 1456.620, 1084.367, 0, 4},
            [14] = {221.856, 1140.510, 1082.609, 0, 4},
            [15] = {261.183, 1284.296, 1080.258, 0, 4},
            [16] = {22.829, 1403.676, 1084.430, 0, 5}, 
            [17] = {226.649, 1114.359, 1080.995, 270, 5}, 
            [18] = {140.180, 1366.580, 1083.859, 0, 5},
            [19] = {234.117, 1063.869, 1084.212, 0, 6}, 
            [20] = {-68.463, 1352.098, 1080.211, 0, 6},
            [21] = {-42.580, 1405.610, 1084.430, 0, 8},
            [22] = {82.950, 1322.440, 1083.866, 0, 9},
            [23] = {260.746, 1237.463, 1084.258, 0, 9},
            [24] = {23.873, 1340.280, 1084.375, 0, 10},
            [25] = {-283.550, 1470.980, 1084.375, 90, 15},
            [26] = {327.910, 1477.916, 1084.438, 0, 15},
            [27] = {376.704, 1417.262, 1081.328, 90, 15},
            [28] = {386.824, 1471.668, 1080.195, 90, 15},
            [29] = {294.935, 1472.324, 1080.258, 0, 15}, 
            [30] = {2468.599, -1698.334, 1013.508, 90, 2},
            [31] = {2807.620, -1174.100, 1025.570, 0, 8}, 
            [32] = {2217.540, -1076.290, 1050.484, 90, 1},
            [33] = {2233.747, -1115.108, 1050.883, 0, 5},
	    }

addEventHandler("onResourceStart",root,function()
    dbQuery(evleriolustur,db,"SELECT * FROM veriler")
end)

function evleriolustur(veriler)
    result = dbPoll(veriler,0)
    for i,v in pairs(result) do
        local lokasyon = fromJSON(v["evxyz"])
        local x,y,z = unpack(lokasyon)
        local evlogo
        if v["evdurum"] == "Satılık" or v["evkiradurum"] == "Kiralık" then
            evlogo = createPickup ( x, y, z, 3, 1273, 0 )
        else
            evlogo = createPickup ( x, y, z, 3, 1272, 0 )
        end
		local evalan = createColTube ( x, y, z - 1, 0.9, 2 )
        local evid = v.id
        table.insert( evler, {evlogo,evalan,evid} )
        setElementData(evalan,"EvSystem:ID",evid)
        addEventHandler ( "onColShapeHit", evalan, evegiris )
    end
end
local tepki

function evegiris(oyuncu)
    evid = getElementData(source,"EvSystem:ID")
    tepki = oyuncu
    dbQuery(gonder,db,"SELECT * FROM veriler WHERE id = ?",tonumber(evid))
end

function gonder(veriler)
    local result = dbPoll(veriler,0)
    triggerClientEvent(tepki,"EvSystem:LoginPanel",tepki,result)
end

addEvent("EvSystem:EvOlustur",true)
addEventHandler("EvSystem:EvOlustur",root,function(evsahibi,evinterior,satisfiyat,kilits,ids)
    local x,y,z = getElementPosition(source)
    local tablo = {tostring(x),tostring(y),tostring(z)}
    local konum = toJSON(tablo)
    dbExec(db,"INSERT INTO veriler(id,evsahip,evinterior,evxyz,evfiyat,evoncekifiyat,evdurum,evoncekisahip,evsatistarih,evkilitdurum,evkiradurum,evkiraci,evkirafiyat,evoncekikirafiyat) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",ids,evsahibi,evinterior,konum,satisfiyat,"-","Satılık","Sunucu","Yok",kilits,"Kiralık Değil","-","-","-")
    local evlogo = createPickup ( x, y, z, 3, 1273, 0 )
    local evalan = createColTube ( x, y, z - 1, 0.9, 2 )
    local result = dbPoll(dbQuery(db,"SELECT * FROM veriler WHERE evsahip = ?",evsahibi),-1)
    setElementData(evalan,"EvSystem:ID",ids)
    table.insert( evler, {evlogo,evalan,ids} )
    addEventHandler ( "onColShapeHit", evalan, evegiris )
    outputChatBox("Başarıyla Ev Oluşturuldu",source,255,255,255,true)
end)

addEvent("EvSystem:EvSil",true)
addEventHandler("EvSystem:EvSil",root,function(id)
    dbExec(db,"DELETE FROM veriler WHERE id = ?",tonumber(id))
    for i,v in pairs(evler) do
        if tostring(v[3]) == tostring(id) then
            destroyElement(v[1])
            destroyElement(v[2]) 
        end
    end
end)

addEvent("EvSystem:Update",true)
addEventHandler("EvSystem:Update",root,function(id,evsahip,evsatisfiyat,evlock,evinterior)
    dbExec(db,"UPDATE veriler SET evsahip = ?, evfiyat = ?, evkilitdurum = ?, evinterior = ? WHERE id = ?",evsahip,evsatisfiyat,evlock,evinterior,id)
    outputChatBox("Başarıyla Ev bilgileri Güncellendi!",source,255,255,255,true)
end)

addEvent("EvSystem:HomeLogin",true)
addEventHandler("EvSystem:HomeLogin",root,function(id)
    local hesap = getAccountName(getPlayerAccount(source))
    local result = dbPoll(dbQuery(db,"SELECT * FROM veriler"),-1)
    local evsahibi
    local evkiracisi
    local evkiliti
	local dimension
    local evint
    local satilikdurum
    local varmi = false
    local kiradurum
    for i,v in pairs(result) do
        if tonumber(id) == tonumber(v.id) then
            evsahibi = tostring(v.evsahip)
            evkiracisi = tostring(v.evkiraci)
            evkiliti = tostring(v.evkilitdurum)
            evint = v.evinterior
			dimension = v.id
            satilikdurum = v.evdurum
            kiradurum = v.evkiradurum
        end
    end
    if evkiliti == "Kilitli" then
        if tostring(hesap) == tostring(evsahibi) then
            local durum = "Sahip"
            triggerClientEvent(source,"EvSystem:AdminPanelAc",source,durum,evkiliti,satilikdurum,kiradurum)
        elseif tostring(hesap) == tostring(evkiracisi) then
            local durum = "Kiracı"
            triggerClientEvent(source,"EvSystem:AdminPanelAc",source,durum,evkiliti,satilikdurum,kiradurum)
        else
            outputChatBox("#ffffffEv #ff7f00Kilitli olduğu için, #ffffffeve giriş yapamazsınız.",source,255,255,255,true)
        end
    elseif evkiliti == "Kilitsiz" then
        if tostring(hesap) == tostring(evsahibi) then
            local durum = "Sahip"
            triggerClientEvent(source,"EvSystem:AdminPanelAc",source,durum,evkiliti,satilikdurum,kiradurum)
            elseif tostring(hesap) == tostring(evkiracisi) then
            local durum = "Kiracı"
            triggerClientEvent(source,"EvSystem:AdminPanelAc",source,durum,evkiliti,satilikdurum,kiradurum)
         else
            setElementFrozen( source, false );
            fadeCamera( source, false );
            toggleAllControls( source, false );
            hesapa = getPlayerAccount(source)
            setAccountData(hesapa,"EvSystem:Giris","true")
            local evid = tonumber(evint)
            for i,v in pairs(markerlar) do
                if v[1] == dimension then
                    varmi = true
                end
            end
            if varmi ~= true then
            local markersasd = createMarker ( interiorlar[evid][1], interiorlar[evid][2], interiorlar[evid][3]-1, "cylinder", 1.2, 255, 127, 0, 170 )
            addEventHandler("onMarkerHit",markersasd,evdencikis)
            setElementInterior( markersasd, interiorlar[evid][5])
            setElementDimension(markersasd,dimension)
            table.insert( markerlar,{dimension,markersasd})
            end
            triggerClientEvent(source,"EvSystem:PanelKapa",source)
            setTimer( function( player )
              if getPedOccupiedVehicle( player ) then removePedFromVehicle( player ) end
                px,py,pz = getElementPosition(player)
                setElementInterior( player, interiorlar[evid][5], interiorlar[evid][1], interiorlar[evid][2], interiorlar[evid][3])
                setElementDimension(player, tonumber(dimension))
                toggleAllControls( player, true );
                fadeCamera( player, true );
            end, 1200, 1, client, t );
            setTimer(function()
                setAccountData(hesapa,"EvSystem:Giris","false")
            end,2000,1,client,t)
        end
    end
end)

function evdencikis(oyuncu)
    if getAccountData(getPlayerAccount(oyuncu),"EvSystem:Giris") == "false" then
    if getElementInterior(oyuncu) > 0 then
        toggleAllControls(oyuncu,false)
        fadeCamera(oyuncu,false)
        setTimer(function()
            setElementDimension(oyuncu,0)
            setElementInterior( oyuncu, 0,px,py,pz)
            toggleAllControls(oyuncu,true)
            fadeCamera(oyuncu,true)
        end, 1200,1,client,t)
        end
    end
end

addEvent("EvSystem:AdminLogin",true)
addEventHandler("EvSystem:AdminLogin",root,function(iad)
    local evid
	local dimension
    for i,v in pairs(result) do
        if tonumber(iad) == tonumber(v.id) then
            evint = v.evinterior
			dimension = v.id
            evid = v.id
        end
    end
    setElementFrozen( source, false );
    fadeCamera( source, false );
    toggleAllControls( source, false );
    hesapa = getPlayerAccount(source)
    setAccountData(hesapa,"EvSystem:Giris","true")
    local evid = tonumber(evint)
    for i,v in pairs(markerlar) do
        if v[1] == dimension then
            varmi = true
        end
    end
    if varmi ~= true then
    local markersasd = createMarker ( interiorlar[evid][1], interiorlar[evid][2], interiorlar[evid][3]-1, "cylinder", 1.2, 255, 127, 0, 170 )
    addEventHandler("onMarkerHit",markersasd,evdencikis)
    setElementInterior( markersasd, interiorlar[evid][5])
    setElementDimension(markersasd,dimension)
    table.insert( markerlar,{dimension,markersasd})
    end
    triggerClientEvent(source,"EvSystem:PanelKapa",source)
    setTimer( function( player )
      if getPedOccupiedVehicle( player ) then removePedFromVehicle( player ) end
        px,py,pz = getElementPosition(player)
        setElementInterior( player, interiorlar[evid][5], interiorlar[evid][1], interiorlar[evid][2], interiorlar[evid][3])
        setElementDimension(player, tonumber(dimension))
        toggleAllControls( player, true );
        fadeCamera(player,true);
    end, 1200, 1, client, t );
    setTimer(function()
        setAccountData(hesapa,"EvSystem:Giris","false")
    end,2000,1,client,t)
end)

addEvent("EvSystem:HomeLock",true)
addEventHandler("EvSystem:HomeLock",root,function(id)
    local results = dbPoll(dbQuery(db,"SELECT * FROM veriler"),-1)
    local kilitdurum
    for i,v in pairs(results) do
        if tostring(id) == tostring(v.id) then
            kilitdurum = v.evkilitdurum
        end
    end
    if tostring(kilitdurum) == "Kilitli" then
        dbExec(db,"UPDATE veriler SET evkilitdurum = ? WHERE id = ?","Kilitsiz",id)
        outputChatBox("Evin Kilidi başarıyla açıldı.",source,255,255,255,true)
        triggerClientEvent(source,"EvSystem:DunyaninEnGereksizEventi",source,"ac")
    end
    if tostring(kilitdurum) == "Kilitsiz" then
        dbExec(db,"UPDATE veriler SET evkilitdurum = ? WHERE id = ?","Kilitli",id)
        outputChatBox("Ev başarıyla kilitlendi.",source,255,255,255,true)
        triggerClientEvent(source,"EvSystem:DunyaninEnGereksizEventi",source,"kiltle")
    end
end)

addEventHandler("onPlayerWasted",root,function()
    if getElementInterior(source) > 0 then
        exports.hud:drawNote("SatilikYazi", "",source, 255,255,255)	
        end
end)

addCommandHandler("evolustur",function(oyuncu,cmd)
    local hesap = getAccountName(getPlayerAccount(oyuncu))
    if isObjectInACLGroup("user."..hesap, aclGetGroup("Console")) then 
        local veriler = dbPoll(dbQuery(db,"SELECT * FROM veriler ORDER BY id ASC"),-1)
        triggerClientEvent(oyuncu,"EvSystem:AdminPanelOpen",oyuncu,veriler)
    end
end)

function BankayaParaGonder(kisi,miktar)
    exports["bankasistem"]:AraziParasiniVer(miktar,kisi)
end

addEvent("EvSystem:HomeBuying",true)
addEventHandler("EvSystem:HomeBuying",root,function(durum,id)
    local hesap = getAccountName(getPlayerAccount(source))
    local evadedi = 0
    local oncekievsahip
    local evfiyat
    local evdurumu
    local result = dbPoll(dbQuery(db,"SELECT * FROM veriler"),-1)
    for i,v in pairs(result) do 
        if id == v["id"] then
            oncekievsahip = v["evsahip"]
            evfiyat = v["evfiyat"]
            evdurumu = v["evdurum"]
        end
    end
    for i,v in pairs(result) do
        if tostring(v.evsahip) == tostring(hesap) then
            evadedi = evadedi + 1
        end 
    end
    if tostring(hesap) == tostring(oncekievsahip) then outputChatBox("#ffffffMaalesef #ff7f00Ev sana ait olduğu için, #ffffffevi satın alamadın.",source,255,255,255,true) return end
    if evadedi < evsiniri then
        if tostring(evdurumu) == "Satılık" then
            if getPlayerMoney(source) >= tonumber(evfiyat) then
                takePlayerMoney(source,tonumber(evfiyat))
                local time = getRealTime()
                local monthday = time.monthday
                local month = time.month
                local year = time.year
                local tarih = string.format("%02d-%02d-%04d", monthday, month + 1, year + 1900)
                dbExec(db,"UPDATE veriler SET evsahip = ?, evoncekifiyat = ?, evdurum = ?, evoncekisahip = ?, evsatistarih = ? WHERE id = ?",hesap,evfiyat,"Satılık Değil",tostring(oncekievsahip),tostring(tarih),id)
                --BankayaParaGonder(oncekievsahip,evfiyat)
                for i,v in pairs(evler) do
                    if tostring(v[3]) == tostring(id) then
                        setPickupType(v[1],3,1272)
                        print("sa")
                    end
                end
                outputChatBox("#ffffffBaşarıyla #ff7f00#"..id.." ID".." #ffffff'ye sahip evi satın aldınız!",source,255,255,255,true)
                triggerClientEvent(source,"EvSystem:PanelKapa",source)
            else
                outputChatBox("#ffffffMaalesef #ff7f00Yeterli Paranız olmadığı için, #ffffffevi satın alamadınız.",source,255,255,255,true)
            end
        else
            outputChatBox("#ffffffMaalesef #ff7f00Ev satılık olmadığı için, #ffffffevi satın alamadınız.",source,255,255,255,true)
        end
    else
        outputChatBox("#ffffffMaalesef #ff7f00Ev sınırını aştığınız için, #ffffffevi satın alamadınız. Ev Sınırı: #ff7f00"..tostring(evsiniri),source,255,255,255,true)
    end
end)

addEvent("EvSystem:HomeSale",true)
addEventHandler("EvSystem:HomeSale",root,function(id,durums,miktar)
    if durums == "Satıştan Kaldır" then
        for i,v in pairs(evler) do
            if tostring(v[3]) == tostring(id) then
                setPickupType(v[1],3,1272)
            end
        end
        dbExec(db,"UPDATE veriler SET evdurum = ? WHERE id = ?","Satılık Değil",id)
        outputChatBox("#FFFFFFEvinizi Başarıyla #ff7f00Satılıktan Çıkardınız!",source,255,255,255,true)
        triggerClientEvent(source,"EvSystem:PanelKapa2",source)
    elseif durums == "Satışa Çıkar" then
	if miktar == "" then outputChatBox("#ffffffEvinizi satmak için #ff7f00bir değer #ffffffgirmelisiniz.",source,255,255,255,true) return end
        if tonumber(miktar) <= 0 then outputChatBox("#ffffffEvinizi #ff7f000 veya daha düşük bir fiyata #ffffffsatamazsınız.",255,255,255,true) return end
        for i,v in pairs(evler) do
            if tostring(v[3]) == tostring(id) then
                setPickupType(v[1],3,1273)
            end
        end
        dbExec(db,"UPDATE veriler SET evfiyat = ?, evdurum = ? WHERE id = ?",tonumber(miktar),"Satılık",id)
        outputChatBox("#FFFFFFEvinizi Başarıyla #ff7f00Satılığa Çıkardınız!",source,255,255,255,true)
        triggerClientEvent(source,"EvSystem:PanelKapa2",source)
    end
    if durums == "Kiralığa Çıkar" then
	if miktar == "" then outputChatBox("#ffffffEvinizi kiralamak için #ff7f00bir değer #ffffffgirmelisiniz.",source,255,255,255,true) return end
        if tonumber(miktar) <= 0 then outputChatBox("#ffffffEvinizi #ff7f000 veya daha düşük bir fiyata #ffffffkiralayamazsınız.",source,255,255,255,true) return end
        for i,v in pairs(evler) do
            if tostring(v[3]) == tostring(id) then
                setPickupType(v[1],3,1273)
            end
        end
        dbExec(db,"UPDATE veriler SET evdurum = ?, evkiradurum = ?, evkirafiyat = ? WHERE id = ?","Kiralık","Kiralık",tonumber(miktar),id)
        outputChatBox("#FFFFFFEvinizi Başarıyla #ff7f00Kiralığa Çıkardınız!",source,255,255,255,true)
        triggerClientEvent(source,"EvSystem:PanelKapa2",source)
    end
    if durums == "Kiradan At" then
        for i,v in pairs(evler) do
            if tostring(v[3]) == tostring(id) then
                setPickupType(v[1],3,1272)
            end
        end
        dbExec(db,"UPDATE veriler SET evdurum = ?, evkiradurum = ?, evkiraci = ?, evkirafiyat = ? WHERE id = ?","Satılık Değil","Kirada Değil","Yok","Yok",id)
        outputChatBox("#FFFFFFEvinizi Başarıyla #ff7f00Kiradan Kaldırdınız.",source,255,255,255,true)
        triggerClientEvent(source,"EvSystem:PanelKapa2",source)
    end
end)

addCommandHandler("kiradancik",function(oyuncu,cmd)
    local resulta = dbPoll(dbQuery(db,"SELECT * FROM veriler"),-1)
    local hesabi = getAccountName(getPlayerAccount(oyuncu))
    local kiracimi = false
    local evid
    for i,v in pairs(resulta) do 
        if tostring(hesabi) == tostring(v["evkiraci"]) then
            kiracimi = true
            evid = v["id"]
        end
    end
    if kiracimi == true then
        dbExec(db,"UPDATE veriler SET evkiraci = ?, evdurum = ?, evkiradurum = ? WHERE id = ?","Yok","Kiralık","Kiralık",evid)
        for i,v in pairs(evler) do
            if tostring(v[3]) == tostring(evid) then
                setPickupType(v[1],3,1273)
            end
        end
        outputChatBox("Kiraladığınız evden, başarıyla çıktınız. Artık kiracı değilsiniz.")
    else
        outputChatBox("Herhangi bir evi kiralamadığınız için, herhangi bir işlem yapılmadı.")
    end
end)

addEvent("EvSystem:HomeRent",true)
addEventHandler("EvSystem:HomeRent",root,function(id)
    local resulta = dbPoll(dbQuery(db,"SELECT * FROM veriler"),-1)
    local hesap = getAccountName(getPlayerAccount(source))
    local kiracimi = false
    local kiradurumu
    local kirafiyati
    local evsahibi
    for i,v in pairs(resulta) do
        if tostring(id) == tostring(v.id) then
            kiradurumu = tostring(v.evkiradurum)
            kirafiyati = tonumber(v.evkirafiyat)
            evsahibi = tostring(v.evsahip)
        end
        if hesap == tostring(v.evkiraci) then
            kiracimi = true
        end
    end
    if kiradurumu == "Kiralık" then
        if getPlayerMoney(source) >= kirafiyati then
            if kiracimi == false then
                if hesap == evsahibi then return outputChatBox("#FFFFFFEv zaten, #ff7f00sana ait. #ffffffKendi evini kiralayamazsın.",source,255,255,255,true) end
                takePlayerMoney(source,kirafiyati)
                --BankayaParaGonder(evsahibi,kirafiyati)
                for i,v in pairs(evler) do
                    if tostring(v[3]) == tostring(id) then
                        setPickupType(v[1],3,1272)
                    end
                end
                dbExec(db,"UPDATE veriler SET evdurum = ?, evkiradurum = ?, evkiraci = ?, evoncekikirafiyat = ? WHERE id = ?","Kirada","Kirada",hesap,kirafiyati,id)
                outputChatBox("#FFFFFFEvi Başarıyla #ff7f00Kiraladınız! #ffffffİlk Kira ücreti ev sahibine gönderildi.",source,255,255,255,true)
                triggerClientEvent(source,"EvSystem:PanelKapa",source)
            else
                outputChatBox("#FFFFFFZaten #ff7f00Başka bir evi #ffffffkiraladınız.",source,255,255,255,true)
            end
        else
            outputChatBox("#FFFFFFEvi kiralamak için, #ff7f00Yeterli Paranız yok.",source,255,255,255,true)
        end
     elseif kiradurumu == "Kirada" then
            outputChatBox("#FFFFFFEv zaten, #ff7f00başka biri tarafından #ffffffkiralanmış.",source,255,255,255,true)
        else
            outputChatBox("#FFFFFFBu ev, şuanda #ff7f00kirada değil.#ffffff kiralamak için, ev sahibine ulaşın.",source,255,255,255,true)
    end
end) 

addCommandHandler("evler",function(oyuncu,cmd)
        local result = dbPoll(dbQuery(db,"SELECT * FROM veriler ORDER BY id ASC"),-1)
        triggerClientEvent(oyuncu,"EvSystem:Homes",oyuncu,result)
end)

addEvent("EvSystem:HomeTP",true)
addEventHandler("EvSystem:HomeTP",root,function(id)
    local result = dbPoll(dbQuery(db,"SELECT * FROM veriler WHERE id = ?",id),-1)
    local x,y,z
    for i,v in pairs(result) do
        local lokasyon = fromJSON(v.evxyz)
        x,y,z = unpack(lokasyon)
    end
    setElementPosition(source,x,y,z)
end)

-- dil

