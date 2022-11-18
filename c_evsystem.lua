loadstring(exports.dgs:dgsImportFunction())()

local id 
sGenislik,sUzunluk = dgsGetScreenSize()
Genislik,Uzunluk = 553,321
X = (sGenislik/2) - (Genislik/2)
Y = (sUzunluk/2) - (Uzunluk/2)

-- Main Menu
mainpanel = dgsCreateWindow(X, Y, Genislik, Uzunluk, "Ev Panel", false)
dgsWindowSetSizable(mainpanel, false)
dgsSetVisible(mainpanel,false)
dgsWindowSetCloseButtonEnabled(mainpanel,false)

local kapatbtn = dgsCreateButton(527, -25, 26, 25, "X", false, mainpanel)
local font0_Font13 = dgsCreateFont("dosya/Font13.ttf", 13)
local font1_Font13 = dgsCreateFont("dosya/Font13.ttf", 10)
evidlbl = dgsCreateLabel(33, 41, 223, 21, "● Ev Sıra: ", false, mainpanel)
local font2_Font13 = dgsCreateFont("dosya/Font13.ttf", 11)
dgsSetFont(evidlbl, font2_Font13)
evsahibilbl = dgsCreateLabel(33, 10, 223, 21, "● Ev Sahibi: ", false, mainpanel) 
dgsSetFont(evsahibilbl, font2_Font13)
evdurumlbl = dgsCreateLabel(284, 41, 259, 21, "● Ev Durumu: ", false, mainpanel) 
dgsSetFont(evdurumlbl, font2_Font13)
evoncekisahiplbl = dgsCreateLabel(284, 10, 259, 21, "● Ev Önceki Sahibi: ", false, mainpanel)
dgsSetFont(evoncekisahiplbl, font2_Font13)
evsatisfiyatlbl = dgsCreateLabel(33, 72, 223, 21, "● Ev Satış Fiyatı: ", false, mainpanel)
dgsSetFont(evsatisfiyatlbl, font2_Font13)
evsatistarihlbl = dgsCreateLabel(33, 103, 162, 21, "● Ev Satış Tarihi: ", false, mainpanel)
dgsSetFont(evsatistarihlbl, font2_Font13)
evoncekifiyatlbl = dgsCreateLabel(284, 72, 259, 21, "● Ev Önceki Fiyatı: ", false, mainpanel)
dgsSetFont(evoncekifiyatlbl, font2_Font13)
cizgi3 = dgsCreateLabel(0, 120, 560, 15, "_______________________________________________________", false, mainpanel)
dgsSetFont(cizgi3, font0_Font13)
evkiracisilbl = dgsCreateLabel(33, 148, 223, 21, "● Kiracı: ", false, mainpanel)
dgsSetFont(evkiracisilbl, font2_Font13)
evkirafiyatlbl = dgsCreateLabel(33, 176, 223, 21, "● Ev Kira Fiyatı: ", false, mainpanel)
dgsSetFont(evkirafiyatlbl, font2_Font13)
evoncekikirafiyatlbl = dgsCreateLabel(284, 176, 259, 21, "● Ev Önceki Kira Fiyatı: ", false, mainpanel)
dgsSetFont(evoncekikirafiyatlbl, font2_Font13)
cizgi5 = dgsCreateLabel(0, 195, 560, 15, "_______________________________________________________", false, mainpanel)
dgsSetFont(cizgi5, font0_Font13)
evisatinalbtn = dgsCreateButton(21, 230, 142, 51, "Satın Al", false, mainpanel)
dgsSetFont(evisatinalbtn, font1_Font13)
evikiralabtn = dgsCreateButton(385, 230, 142, 51, "Kirala", false, mainpanel)
dgsSetFont(evikiralabtn, font1_Font13)
evyonetimibtn = dgsCreateButton(211, 230, 142, 51, "Giriş Yap", false, mainpanel)
dgsSetFont(evyonetimibtn, font1_Font13)
evkilitdurum = dgsCreateLabel(284, 103, 259, 21, "● Ev Kilit Durumu: ", false, mainpanel)
dgsSetFont(evkilitdurum, font2_Font13)

Genisliks,Uzunluks = 554,279
Xs = (sGenislik/2) - (Genisliks/2)
Ys = (sUzunluk/2) - (Uzunluks/2)

--Yönetim Panel
adminpanel = dgsCreateWindow(Xs, Ys, Genisliks, Uzunluks, "Hoşgeldin, Ne yapmak istersin?", false)
dgsWindowSetSizable(adminpanel, false)
dgsSetVisible(adminpanel,false)
dgsWindowSetCloseButtonEnabled(adminpanel,false)

local kapatbtn2 = dgsCreateButton(527, -25, 26, 25, "X", false, adminpanel)
local font1_Font13 = dgsCreateFont("dosya/Font13.ttf", 13)
local font0_Font13 = dgsCreateFont("dosya/Font13.ttf", 10)
bilgilbls1 = dgsCreateLabel(240, 15, 80, 19, "➤ Ev Giriş", false, adminpanel)
dgsSetFont(bilgilbls1, font1_Font13)
cizgi7 = dgsCreateLabel(0, 30, 554, 15, "_______________________________________________________", false, adminpanel)
dgsSetFont(cizgi7, font1_Font13)
admingirisyapbtn = dgsCreateButton(292, 70, 144, 42, "Eve Gir", false, adminpanel)
dgsSetFont(admingirisyapbtn, font0_Font13)
adminevlockbtn = dgsCreateButton(127, 70, 144, 42, "Kilitsiz", false, adminpanel)
dgsSetFont(adminevlockbtn, font0_Font13)
cizgi9 = dgsCreateLabel(5, 114, 554, 15, "_______________________________________________________", false, adminpanel)
dgsSetFont(cizgi9, font1_Font13)
admintext = dgsCreateEdit(38, 200, 171, 42, "", false, adminpanel)
satiligacikarbtn = dgsCreateButton(237, 200, 144, 42, "Satılığa Çıkar", false, adminpanel)
dgsSetFont(satiligacikarbtn, font0_Font13)
kiraligacikarbtn = dgsCreateButton(391, 200, 144, 42, "Kiralığa ÇIKAR", false, adminpanel)
dgsSetFont(kiraligacikarbtn, font0_Font13)

Genislika,Uzunluka = 662,456
Xa = (sGenislik/2) - (Genislika/2)
Ya = (sUzunluk/2) - (Uzunluka/2)
--Oluşturma Panel

createpanel = dgsCreateWindow(Xa, Ya, Genislika, Uzunluka, "Ev Oluşturma Panel", false)
dgsWindowSetSizable(createpanel, false)
dgsSetVisible(createpanel,false)
dgsWindowSetCloseButtonEnabled(createpanel,false)

listegridlst = dgsCreateGridList(17, 28, 300, 388, false, createpanel)
dgsGridListAddColumn(listegridlst, "Sıra", 0.2)
dgsGridListAddColumn(listegridlst, "sahip", 0.2)
dgsGridListAddColumn(listegridlst, "fiyat", 0.3)
dgsGridListAddColumn(listegridlst, "içi", 0.3)
dgsGridListAddColumn(listegridlst, "Kilit", 0.4)
dgsGridListAddColumn(listegridlst, "konum", 0.4)
evidlbls = dgsCreateLabel(365, 20, 116, 26, "Ev Sıra :", false, createpanel)
evidtxt = dgsCreateEdit(450, 10, 172, 31, "", false, createpanel)
evsahiplbl = dgsCreateLabel(365, 65, 56, 26, "Ev Sahibi:", false, createpanel)
evsahiptxt = dgsCreateEdit(450, 55, 172, 31, "", false, createpanel)
evsatisfiyatlbl2 = dgsCreateLabel(365, 110, 81, 26, "Ev Satış Fiyatı:", false, createpanel)
evsatisfiyattxt = dgsCreateEdit(450, 100, 172, 31, "", false, createpanel)
evlocklbl = dgsCreateLabel(365, 155, 81, 26, "Ev Kilidi:", false, createpanel)
evlockcmbox = dgsCreateComboBox(450, 145, 172, 31, "", false, createpanel)
dgsComboBoxAddItem(evlockcmbox,"Kilitli")
dgsComboBoxAddItem(evlockcmbox,"Kilitsiz")
evinterioridlbl = dgsCreateLabel(365, 200, 81, 26, "Ev Interior ID:", false, createpanel)
evinterioridtxt = dgsCreateEdit(450, 190, 172, 31, "", false, createpanel)
olusturbtn = dgsCreateButton(491, 250, 137, 43, "Oluştur", false, createpanel)
duzenlebtn = dgsCreateButton(344, 250, 137, 43, "Düzenle", false, createpanel)
konumkopyalabtn = dgsCreateButton(491, 310, 137, 43, "Konumu Kopyala", false, createpanel)
evisilbtn = dgsCreateButton(344, 310, 137, 43, "Evi Sil", false, createpanel)

Genislikc,Uzunlukc = 722,380
Xc = (sGenislik/2) - (Genislikc/2)
Yc = (sUzunluk/2) - (Uzunlukc/2)
--Evler Paneli
evlerpanel = dgsCreateWindow(Xc, Yc, Genislikc, Uzunlukc, "Evler",false)
dgsWindowSetSizable(evlerpanel, false)
dgsSetVisible(evlerpanel,false)
dgsWindowSetCloseButtonEnabled(evlerpanel,false)

evlerlist = dgsCreateGridList(13, 26, 699, 264, false, evlerpanel)
dgsGridListAddColumn(evlerlist, "Ev Sıra", 0.2)
dgsGridListAddColumn(evlerlist, "Ev Sahibi", 0.2)
dgsGridListAddColumn(evlerlist, "Ev Durumu", 0.2)
dgsGridListAddColumn(evlerlist, "Ev Fiyatı", 0.2)
dgsGridListAddColumn(evlerlist, "Kira Durumu", 0.2)
eveisinlanbtn = dgsCreateButton(412, 300, 141, 36, "Eve ışınlan", false, evlerpanel)
panelikapatbtn = dgsCreateButton(194, 300, 141, 36, "Paneli Kapat", false, evlerpanel)

addEventHandler("onDgsMouseClickUp",getRootElement(),function()
        if source == panelikapatbtn then
                dgsSetVisible(evlerpanel,false)
                showCursor(false)
        end
        if source == eveisinlanbtn then
                local id = dgsGridListGetItemText(evlerlist, dgsGridListGetSelectedItem(evlerlist), 1)
                if tonumber(id) ~= nil and tonumber(id) >= 1 then
                dgsSetVisible(evlerpanel,false)
                showCursor(false)
                triggerServerEvent("EvSystem:HomeTP",localPlayer,id)
                else
                        outputChatBox("lütfen listeden bir ev seçin.",255,255,255,true)
                end
        end
end)

addEventHandler("onDgsMouseClickUp",getRootElement(),function()
        if source == evisatinalbtn then
                local durum = dgsGetText(evdurumlbl)
                triggerServerEvent("EvSystem:HomeBuying",localPlayer,durum,id)
        end
        if source == evyonetimibtn then
                triggerServerEvent("EvSystem:HomeLogin",localPlayer,id)
        end
        if source == adminevlockbtn then
                triggerServerEvent("EvSystem:HomeLock",localPlayer,id)
        end
        if source == admingirisyapbtn then
                dgsSetVisible(adminpanel,false)
                showCursor(false)
                triggerServerEvent("EvSystem:AdminLogin",localPlayer,id)
        end
        if source == satiligacikarbtn then 
                local sa = dgsGetText(satiligacikarbtn)
                local miktar = dgsGetText(admintext)
                triggerServerEvent("EvSystem:HomeSale",localPlayer,id,sa,miktar)
        end
        if source == kiraligacikarbtn then
                local sa = dgsGetText(kiraligacikarbtn)
                local miktar = dgsGetText(admintext)
                triggerServerEvent("EvSystem:HomeSale",localPlayer,id,sa,miktar)
        end
        if source == evikiralabtn then
                triggerServerEvent("EvSystem:HomeRent",localPlayer,id)
        end
        if source == konumkopyalabtn then
                local konum = dgsGridListGetItemText(listegridlst, dgsGridListGetSelectedItem(listegridlst), 6)
                if konum ~= nil then
                        setClipboard(tostring(konum));
                        outputChatBox("Seçili evin konumu başarıyla kopyalandı!")
                end
        end
end)

addEventHandler("onDgsMouseClickUp",getRootElement(),function()
        if source == listegridlst then
                local sel = dgsGridListGetSelectedItem(listegridlst)
		if sel ~= -1 then 
                        dgsSetText(evidtxt,dgsGridListGetItemText(listegridlst,sel,1))
                        dgsSetText(evsahiptxt,dgsGridListGetItemText(listegridlst,sel,2))
                        dgsSetText(evsatisfiyattxt,dgsGridListGetItemText(listegridlst,sel,3))
                        dgsSetText(evinterioridtxt,dgsGridListGetItemText(listegridlst,sel,4))
                        if tostring(dgsGridListGetItemText(listegridlst,sel,5)) == "Kilitli" then
                                dgsComboBoxSetSelectedItem(evlockcmbox,1)
                        else
                                dgsComboBoxSetSelectedItem(evlockcmbox,2)
                        end
                else
                        dgsSetText(evidtxt,"")
                        dgsSetText(evsahiptxt,"")
                        dgsSetText(evsatisfiyattxt,"")
                        dgsSetText(evinterioridtxt,"")
                        dgsComboBoxSetSelectedItem(evlockcmbox,-1)
		end
        end
        if source == olusturbtn then
                local evid = dgsGetText(evidtxt)
                local evsahip = dgsGetText(evsahiptxt)
                local evsatisfiyat = dgsGetText(evsatisfiyattxt)
                secili = dgsComboBoxGetSelectedItem(evlockcmbox)
                local evlock = dgsComboBoxGetItemText(evlockcmbox,secili)
                local evinterior = dgsGetText(evinterioridtxt)
                print(evlock)
                triggerServerEvent("EvSystem:EvOlustur",localPlayer,evsahip,evinterior,evsatisfiyat,evlock,evid)
                dgsSetVisible(createpanel,false)
                showCursor(false)
                dgsSetInputEnabled(false)
        end
        if source == evisilbtn then
                local ides = dgsGetText(evidtxt)
                if tonumber(ides) <= 0 then outputChatBox("Ev Seçin.") return end
                triggerServerEvent("EvSystem:EvSil",localPlayer,tostring(ides))
                dgsSetVisible(createpanel,false)
                showCursor(false)
                dgsSetInputEnabled(false)
                outputChatBox("Ev Başarıyla Silindi.")
        end
        if source == duzenlebtn then
                local sel = dgsGridListGetSelectedItem(listegridlst)
                local id = dgsGridListGetItemText(listegridlst,sel,1)
                local evid = dgsGetText(evidtxt)
                if id ~= evid then outputChatBox("Evin Sırasını Güncelleyemezsin.") return end
                local evsahip = dgsGetText(evsahiptxt)
                local evsatisfiyat = dgsGetText(evsatisfiyattxt)
                secili = dgsComboBoxGetSelectedItem(evlockcmbox)
                local evlock = dgsComboBoxGetItemText(evlockcmbox,secili)
                local evinterior = dgsGetText(evinterioridtxt)
                triggerServerEvent("EvSystem:Update",localPlayer,evid,evsahip,evsatisfiyat,evlock,evinterior)
                dgsSetVisible(createpanel,false)
                showCursor(false)
                dgsSetInputEnabled(false)
        end
end)

addEventHandler("onDgsMouseClickUp",getRootElement(),function()
        if source == kapatbtn then
                dgsSetVisible(mainpanel,false)
                showCursor(false)
        end
        if source == kapatbtn2 then
                dgsSetVisible(adminpanel,false)
                showCursor(false)
        end
        if source == evyonetimibtn then
                triggerServerEvent("EvSystem:HomeLogin",localPlayer,id)
        end
end)

addEvent("EvSystem:Homes",true)
addEventHandler("EvSystem:Homes",root,function(veriler)
        dgsGridListClear(evlerlist)
        for i,v in pairs(veriler) do
                if v["evdurum"] == "Satılık" or v["evkiradurum"] == "Kiralık" then
                        row = dgsGridListAddRow(evlerlist) 
                        dgsGridListSetItemText(evlerlist,row,1,v["id"])
                        dgsGridListSetItemText(evlerlist,row,2,v["evsahip"])
                        dgsGridListSetItemText(evlerlist,row,3,v["evdurum"])
                        dgsGridListSetItemText(evlerlist,row,4,v["evfiyat"])
                        dgsGridListSetItemText(evlerlist,row,5,v["evkiradurum"])
                        dgsGridListSetItemColor( evlerlist, row, 1, 0, 255, 0 )
                        dgsGridListSetItemColor( evlerlist, row, 2, 0, 255, 0 )
                        dgsGridListSetItemColor( evlerlist, row, 3, 0, 255, 0 )
                        dgsGridListSetItemColor( evlerlist, row, 4, 0, 255, 0 )
                        dgsGridListSetItemColor( evlerlist, row, 5, 0, 255, 0 )
                else
                        row = dgsGridListAddRow(evlerlist) 
                        dgsGridListSetItemText(evlerlist,row,1,v["id"])
                        dgsGridListSetItemText(evlerlist,row,2,v["evsahip"])
                        dgsGridListSetItemText(evlerlist,row,3,v["evdurum"])
                        dgsGridListSetItemText(evlerlist,row,4,v["evfiyat"])
                        dgsGridListSetItemText(evlerlist,row,5,v["evkiradurum"])
                end
        end
        dgsSetVisible(evlerpanel,true)
        showCursor(true)
end)

addEvent("EvSystem:AdminPanelOpen",true)
addEventHandler("EvSystem:AdminPanelOpen",root,function(veriler)
        local durum = dgsGetVisible(createpanel)
        if durum then
        dgsSetVisible(createpanel,false)
        dgsSetInputEnabled(false)
        showCursor(false)
        else
        dgsGridListClear(listegridlst)
        for i,v in pairs(veriler) do
                local veri = fromJSON(v["evxyz"])
                local x,y,z = unpack(veri)
                row = dgsGridListAddRow(listegridlst) 
                dgsGridListSetItemText(listegridlst,row,1,v["id"])
                dgsGridListSetItemText(listegridlst,row,2,v["evsahip"])
                dgsGridListSetItemText(listegridlst,row,3,v["evfiyat"])
                dgsGridListSetItemText(listegridlst,row,4,v["evinterior"])
                dgsGridListSetItemText(listegridlst,row,5,v["evkilitdurum"])
                dgsGridListSetItemText(listegridlst,row,6,tostring(x)..", "..tostring(y)..", "..tostring(z))
        end
        dgsSetVisible(createpanel,true)
        showCursor(true)
        dgsSetInputEnabled(true)
        end
end)

addEvent("EvSystem:LoginPanel",true)
addEventHandler("EvSystem:LoginPanel",root,function(veriler)
        for i,v in pairs(veriler) do 
                dgsSetText(evidlbl,"● Ev Sıra: "..v["id"])
                dgsSetText(evsahibilbl,"● Ev Sahibi: "..v["evsahip"])
                dgsSetText(evdurumlbl, "● Ev Durumu: "..v["evdurum"])
                dgsSetText(evoncekisahiplbl,"● Ev Önceki Sahibi: "..tostring(v["evoncekisahip"] or "Sunucu"))
                dgsSetText(evsatisfiyatlbl, "● Ev Satış Fiyatı: "..v["evfiyat"])
                dgsSetText(evsatistarihlbl,"● Ev Satış Tarihi: "..tostring(v["evsatistarih"] or "-"))
                dgsSetText(evoncekifiyatlbl,  "● Ev Önceki Fiyatı: "..tostring(v["evoncekifiyat"] or "-"))
                dgsSetText(evkiracisilbl,"● Kiracı: "..tostring(v["evkiraci"] or "-"))
                dgsSetText(evkirafiyatlbl,"● Ev Kira Fiyatı: "..tostring(v["evkirafiyat"] or "-"))
                dgsSetText(evoncekikirafiyatlbl, "● Ev Önceki Kira Fiyatı: "..tostring(v["evoncekikirafiyat"] or "-"))
		dgsSetText(evkilitdurum,"● Ev Kilit Durumu: "..tostring(v["evkilitdurum"] or "Kilitsiz"))
                if tostring(v["evkiradurum"]) == "Kirada" then
                        dgsSetText(kiraligacikarbtn,"Kiradan At")
                else
                        dgsSetText(kiraligacikarbtn,"Kiralığa Çıkar")
                end
                id = tonumber(v["id"])
        end
        dgsSetVisible(mainpanel,true)
        showCursor(true)
end)

addEvent("EvSystem:AdminPanelAc",true)
addEventHandler("EvSystem:AdminPanelAc",root,function(durum,evkilitdurum,satisdurum,kiradurum)
        if durum == "Sahip" then
                dgsSetText(adminevlockbtn,"Ev Kilidi: "..evkilitdurum) 
                if satisdurum == "Satılık" then dgsSetText(satiligacikarbtn,"Satıştan Kaldır") end
                if satisdurum == "Satılık Değil" then dgsSetText(satiligacikarbtn,"Satışa Çıkar") end
                if kiradurum == "Kiralık" then dgsSetText(kiraligacikarbtn,"Kiradan At") end
                if kiradurum == "Kiralık Değil" then dgsSetText(kiraligacikarbtn,"Kiralığa Çıkar") end
                dgsSetVisible(mainpanel,false)
                dgsSetEnabled(satiligacikarbtn,true)
                dgsSetEnabled(kiraligacikarbtn,true)
                dgsSetEnabled(admintext,true)
                dgsSetVisible(adminpanel,true)
                showCursor(true)
        elseif durum == "Kiracı" then
                if satisdurum == "Satılık" then dgsSetText(satiligacikarbtn,"Satıştan Kaldır") end
                if satisdurum == "Satılık Değil" then dgsSetText(satiligacikarbtn,"Satışa Çıkar") end
                dgsSetText(adminevlockbtn,"Ev Kilidi: "..evkilitdurum)
                dgsSetVisible(mainpanel,false)
                dgsSetEnabled(satiligacikarbtn,false)
                dgsSetEnabled(kiraligacikarbtn,false)
                dgsSetEnabled(admintext,false)
                dgsSetVisible(adminpanel,true)
                showCursor(true)
        end
end)

addEvent("EvSystem:DunyaninEnGereksizEventi",true)
addEventHandler("EvSystem:DunyaninEnGereksizEventi",root,function(ss)
        if ss == "kiltle" then
                dgsSetText(adminevlockbtn,"Ev Kilidi: Kilitli")
        elseif ss == "ac" then
                dgsSetText(adminevlockbtn,"Ev Kilidi: Kilitsiz")
        end
end)

addEvent("EvSystem:PanelKapa",true)
addEventHandler("EvSystem:PanelKapa",getRootElement(),function()
        dgsSetVisible(mainpanel,false)
        showCursor(false)
end)

addEvent("EvSystem:PanelKapa2",true)
addEventHandler("EvSystem:PanelKapa2",getRootElement(),function()
        dgsSetVisible(adminpanel,false)
        showCursor(false)
end)

addEvent("EvSystem:Panels",true)
addEventHandler("EvSystem:Panels",getRootElement(),function()
        exports.hud:drawProgressBar("unDamaged", "Evden Çıkılıyor", 255, 127, 0, 3000)
end)

function math.round(number, des, method)
        des = des or 0
        local factor = 10 ^ des
        if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
        else return tonumber(("%."..des.."f"):format(number)) end
end
