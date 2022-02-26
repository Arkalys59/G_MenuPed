Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

local mainMenu = RageUI.CreateMenu("Menu Peds", "MENU")

local open = false
local listanimaux,listdanseuse,listbaby,listhistoire,listgangs,listdrug,listother,listems,listsecurity,listlspd = 1,1,1,1,1,1,1,1,1,1

mainMenu.Closed = function() open = false end

function Peds()
    if not open then open = true RageUI.Visible(mainMenu, true)
        CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    RageUI.Button("Reprendre son apparence", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                local value = skin.sex == 0
                                TriggerEvent('skinchanger:loadDefaultModel', value, function()
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                        TriggerEvent('skinchanger:loadSkin', skin)
                                        TriggerEvent('esx:restoreLoadout')
                                    end)
                                end)
                            end)
                        end
                    })
                    RageUI.Button("Ped Personnalisé", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            local hash = KeyboardInput("Entrez le hash de votre ped personnalisé", "(exemple : a_f_m_beach_01)", 40)
                            createped(hash)
                        end
                    })
                    RageUI.Separator("↓ Liste des peds ↓")
                    RageUI.List("EMS", {"EMS", "EMS 2", "EMS 3", "Docteur", "Docteur 2", "Médecin", "Ambulancier"}, listems, nil, {}, true, {
                        onListChange = function(list) listems = list end,
                        onSelected = function(list)
                            if list == 1 then 
                                createped(GetHashKey('u_f_m_corpse_01'))
                            elseif list == 2 then 
                                createped(GetHashKey('u_f_y_corpse_01'))
                            elseif list == 3 then 
                                createped(GetHashKey('u_f_y_corpse_02'))
                            elseif list == 4 then 
                                createped(GetHashKey('s_m_m_doctor_01'))
                            elseif list == 5 then 
                                createped(GetHashKey('s_m_m_scientist_01'))
                            elseif list == 6 then 
                                createped(GetHashKey('s_f_y_scrubs_01'))
                            elseif list == 7 then 
                                createped(GetHashKey('s_m_m_paramedic_01'))
                            end
                        end
                    })
                    RageUI.List("LSPD", {"LSPD", "LSPD 2", "LSPD 3"}, listlspd, nil, {}, true, {
                        onListChange = function(list) listlspd = list end,
                        onSelected = function(list)
                            if list == 1 then 
                                createped(GetHashKey('csb_trafficwarden'))
                            elseif list == 2 then 
                                createped(GetHashKey('s_f_y_cop_01'))
                            elseif list == 3 then 
                                createped(GetHashKey('s_m_y_cop_01'))
                            end
                        end
                    })
                    RageUI.List("Drogue", {"Meth", "Cocaïne H", "Cocaïne F"}, listdrug, nil, {}, true, {
                        onListChange = function(list) listdrug = list end,
                        onSelected = function(list)
                            if list == 1 then
                                createped(GetHashKey('mp_f_meth_01'))
                            elseif list == 2 then 
                                createped(GetHashKey('mp_m_cocaine_01'))
                            elseif list == 3 then 
                                createped(GetHashKey('mp_f_cocaine_01'))
                            end
                        end
                    })
                    RageUI.List("Autres", {"Alien", "Astronaute", "Rangers", "Robot", "Super-Héros", "Zombie"}, listother, nil, {}, true, {
                        onListChange = function(list) listother = list end,
                        onSelected = function(list)
                            if list == 1 then 
                                createped(GetHashKey('s_m_m_movalien_01'))
                            elseif list == 2 then 
                                createped(GetHashKey('s_m_m_movspace_01'))
                            elseif list == 3 then 
                                createped(GetHashKey('u_m_y_rsranger_01'))
                            elseif list == 4 then 
                                createped(GetHashKey('u_m_y_juggernaut_01'))
                            elseif list == 5 then 
                                createped(GetHashKey('u_m_y_imporage'))
                            elseif list == 6 then 
                                createped(GetHashKey('u_m_y_zombie_01'))
                            end
                        end
                    })
                    RageUI.List("Animaux", {"Singe", "Chat", "Aigle", "Sanglier", "Cormorant", "Vache", "Coyote", "Corbeau", "Biche", "Coq", "Cochon", "Pigeon", "Chien", "Chiwawa", "Bulldog", "Lapin", "Rat", "Mouette"}, listanimaux, nil, {}, true, {
                        onListChange = function(list) listanimaux = list end,
                        onSelected = function(list)
                            if list == 1 then
                                createped(GetHashKey('a_c_chimp'))
                            elseif list == 2 then 
                                createped(GetHashKey('a_c_cat_01'))
                            elseif list == 3 then 
                                createped(GetHashKey('a_c_chickenhawk'))
                            elseif list == 4 then 
                                createped(GetHashKey('a_c_boar'))
                            elseif list == 5 then 
                                createped(GetHashKey('a_c_cormorant'))
                            elseif list == 6 then 
                                createped(GetHashKey('a_c_cow'))
                            elseif list == 7 then 
                                createped(GetHashKey('a_c_coyote'))
                            elseif list == 8 then 
                                createped(GetHashKey('a_c_crow'))
                            elseif list == 9 then 
                                createped(GetHashKey('a_c_deer'))
                            elseif list == 10 then
                                createped(GetHashKey('a_c_hen'))
                            elseif list == 11 then 
                                createped(GetHashKey('a_c_pig'))
                            elseif list == 12 then
                                createped(GetHashKey('a_c_pigeon'))
                            elseif list == 13 then
                                createped(GetHashKey('a_c_westy'))
                            elseif list == 14 then 
                                createped(GetHashKey('a_c_poodle'))
                            elseif list == 15 then 
                                createped(GetHashKey('a_c_pug'))
                            elseif list == 16 then 
                                createped(GetHashKey('a_c_rabbit_01'))
                            elseif list == 17 then 
                                createped(GetHashKey('a_c_rat'))
                            elseif list == 18 then
                                createped(GetHashKey('a_c_seagull'))
                            end
                        end
                    })
                    RageUI.List("Gangs", {"Ballas", "Famillies", "Famillies 2", "Famillies 3", "Coréen", "Coréen 2", "Coréen 3", "Biker", "Biker 2", "Biker 3", "Vagos", "Vagos 2", "Vagos 3", "Marabunta", "Marabunta 2", "Marabunta 3"}, listgangs, nil, {}, true, {
                        onListChange = function(list) listgangs = list end,
                        onSelected = function(list)
                            if list == 1 then 
                                createped(GetHashKey('g_m_y_ballaorig_01'))
                            elseif list == 2 then
                                createped(GetHashKey('g_m_y_famca_01'))
                            elseif list == 3 then
                                createped(GetHashKey('g_m_y_famdnf_01'))
                            elseif list == 4 then
                                createped(GetHashKey('g_m_y_famfor_01'))
                            elseif list == 5 then
                                createped(GetHashKey('g_m_y_korean_01'))
                            elseif list == 6 then
                                createped(GetHashKey('g_m_y_korean_02'))
                            elseif list == 7 then
                                createped(GetHashKey('g_m_y_korlieut_01'))
                            elseif list == 8 then
                                createped(GetHashKey('g_m_y_lost_01'))
                            elseif list == 9 then
                                createped(GetHashKey('g_m_y_lost_02'))
                            elseif list == 10 then
                                createped(GetHashKey('g_m_y_lost_03'))
                            elseif list == 11 then
                                createped(GetHashKey('g_m_y_mexgoon_01'))
                            elseif list == 12 then
                                createped(GetHashKey('g_m_y_mexgoon_02'))
                            elseif list == 13 then
                                createped(GetHashKey('g_m_y_mexgoon_03'))
                            elseif list == 14 then
                                createped(GetHashKey('g_m_y_salvaboss_01'))
                            elseif list == 15 then
                                createped(GetHashKey('g_m_y_salvagoon_01'))
                            elseif list == 16 then
                                createped(GetHashKey('g_m_y_salvagoon_02'))
                            end
                        end
                    })
                    RageUI.List("Lore de GTA", {"Franklin", "Michael", "Trevor", "Tonya"}, listhistoire, nil, {}, true, {
                        onListChange = function(list) listhistoire = list end,
                        onSelected = function(list)
                            if list == 1 then 
                                createped(GetHashKey('player_one'))
                            elseif list == 2 then 
                                createped(GetHashKey('player_zero'))
                            elseif list == 3 then
                                createped(GetHashKey('player_two'))
                            elseif list == 4 then
                                createped(GetHashKey('csb_tonya'))                                                    
                            end
                        end
                    })
                    RageUI.List("Sécurité", {"Secret Service", "IAA"}, listsecurity, nil, {}, true, {
                        onListChange = function(list) listsecurity = list end,
                        onSelected = function(list)
                            if list == 1 then 
                                createped(GetHashKey('s_m_m_chemsec_01'))
                            elseif list == 2 then 
                                createped(GetHashKey('s_m_m_ciasec_01'))
                            end
                        end
                    })
                    RageUI.List("Danseuse", {"Blonde en bikini", "Brune en bikini", "Blonde à bandeau"}, listdanseuse, nil, {}, true, {
                        onListChange = function(list) listdanseuse = list end,
                        onSelected = function(list)
                            if list == 1 then
                                createped(GetHashKey('csb_stripper_01'))
                            elseif list == 2 then 
                                createped(GetHashKey('csb_stripper_02'))   
                            elseif list == 3 then 
                                createped(GetHashKey('a_f_y_topless_01'))
                            end
                        end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

function createped(hash)
    RequestModel(hash)
    while not HasModelLoaded(hash) do 
        Wait(0) 
    end
    SetPlayerModel(PlayerId(), hash)
    SetModelAsNoLongerNeeded(hash)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry .. '')
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Citizen.Wait(0) end
    if UpdateOnscreenKeyboard() ~= 2 then local result = GetOnscreenKeyboardResult() Citizen.Wait(500) blockinput = false return result
    else Citizen.Wait(500) blockinput = false return nil
    end
end

if G_Peds.KeyBind then
    Keys.Register(G_Peds.KeyControl, 'peds', 'Ouvrir le menu peds', function()
        ESX.TriggerServerCallback('G_Peds:Perm', function(perm)
            if perm == 'superadmin' or perm == 'admin' or perm == 'mod' then
                Peds()
            end
        end)
    end)
end

if G_Peds.Command then
    RegisterCommand("menuped", function(source, args)
        ESX.TriggerServerCallback('G_Peds:Perm', function(perm)
            if perm == 'superadmin' or perm == 'admin' or perm == 'mod' then
                Peds()
            end
        end)
    end)
end 