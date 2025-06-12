Apx.Functions = {}


----------------------------------------------------------------------------------------------------
-- FRAMEWORK FUNCTIONS -----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
if ApxConfig.Framework == 'qbcore' then
    QBCore = exports[ApxConfig.ResourceName]:GetCoreObject()
elseif ApxConfig.Framework == 'esx' then
    ESX = exports[ApxConfig.ResourceName]:getSharedObject()
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- STRING AND INTEGRATION FUNCTIONS ----------------------------------------------------------------
----------------------------------------------------------------------------------------------------
local StringCharset = {}
local NumberCharset = {}

for i = 48, 57 do NumberCharset[#NumberCharset + 1] = string.char(i) end
for i = 65, 90 do StringCharset[#StringCharset + 1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset + 1] = string.char(i) end

function Apx.Functions.RandomStr(length)
    if length <= 0 then return '' end
    return Apx.Functions.RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

function Apx.Functions.RandomInt(length)
    if length <= 0 then return '' end
    return Apx.Functions.RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- FUEL FUNCTIONS ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.GetFuel(vehicle, plate)
    if ApxConfig.Fuel == 'LegacyFuel' then
        exports['LegacyFuel']:GetFuel(vehicle)

    elseif ApxConfig.Fuel == 'esx-sna-fuel' then
        exports['esx-sna-fuel']:GetFuel(vehicle)

    elseif ApxConfig.Fuel == 'lj-fuel' then
        exports['lj-fuel']:GetFuel(vehicle)

    elseif ApxConfig.Fuel == 'cdn-fuel' then
        exports['cdn-fuel']:GetFuel(vehicle)

    elseif ApxConfig.Fuel == 'qs-fuelstations' then
        exports['qs-fuelstations']:GetFuel(vehicle)

    elseif ApxConfig.Fuel == 'frkn-fuelstation' then
        exports['frkn-fuelstation']:GetFuel(vehicle)

    elseif ApxConfig.Fuel == 'okokGasStation' then
        exports['okokGasStation']:GetFuel(vehicle)

    elseif ApxConfig.Fuel == 'ti_fuel' then
        exports['ti_fuel']:getFuel(vehicle)

    elseif ApxConfig.Fuel == 'cc-fuel' then
        exports['cc-fuel']:getFuel(vehicle)
        
    elseif ApxConfig.Fuel == 'ox_fuel' then
        Entity(vehicle).state.fuel = fuel_level

    elseif ApxConfig.Fuel == 'ND_Fuel' then
        DecorGetFloat(vehicle, '_ANDY_FUEL_DECORE_')

    elseif ApxConfig.Fuel == 'FRFuel' then
        math.ceil((100 / GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fPetrolTankVolume')) * math.ceil(GetVehicleFuelLevel(vehicle)))

    elseif ApxConfig.Fuel == 'x-fuel' then
        exports['x-fuel']:GetFuel(vehicle)
        
    elseif ApxConfig.Fuel == 'rcore_fuel' then
        exports["rcore_fuel"]:GetVehicleFuelPercentage(vehicle)
        
    elseif ApxConfig.Fuel == 'tam_fuel' then
        local fuel_level = Entity(vehicle).state.fuelLevel
        
    elseif ApxConfig.Fuel == 'renewed-fuel' then
        exports['Renewed-Fuel']:GetFuel(vehicle)
        
    elseif ApxConfig.Fuel == 'bigdaddy-fuel' then
        exports['BigDaddy-Fuel']:GetFuel(vehicle)
        
    elseif ApxConfig.Fuel == 'lc_fuel' then
        exports['lc_fuel']:GetFuel(vehicle)
        
    elseif ApxConfig.Fuel == 'fast-fuel' then
        exports['fast-fuel']:GetFuel(vehicle)
        
        
    end
end
function Apx.Functions.SetFuel(vehicle, fuel_level)
    if ApxConfig.Fuel == 'LegacyFuel' then
        exports['LegacyFuel']:SetFuel(vehicle, fuel_level)

    elseif ApxConfig.Fuel == 'esx-sna-fuel' then
        exports['esx-sna-fuel']:setFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'lj-fuel' then
        exports['lj-fuel']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'cdn-fuel' then
        exports['cdn-fuel']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'qs-fuelstations' then
        exports['qs-fuelstations']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'frkn-fuelstation' then
        exports['frkn-fuelstation']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'okokGasStation' then
        exports['okokGasStation']:SetFuel(vehicle, fuel_level)

    elseif ApxConfig.Fuel == 'ti_fuel' then
        exports['ti_fuel']:setFuel(vehicle, fuel_level)

    elseif ApxConfig.Fuel == 'cc-fuel' then
        exports['cc-fuel']:setFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'ox_fuel' then
        Entity(vehicle).state.fuel = fuel_level
        
    elseif ApxConfig.Fuel == 'ND_Fuel' then
        SetVehicleFuelLevel(vehicle, fuel_level + 0.0)
		DecorSetFloat(vehicle, '_ANDY_FUEL_DECORE_', fuel_level + 0.0)
        
    elseif ApxConfig.Fuel == 'FRFuel' then
        SetVehicleFuelLevel(vehicle, fuel_level + 0.0)
        
    elseif ApxConfig.Fuel == 'x-fuel' then
        exports['x-fuel']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'rcore_fuel' then
        exports["rcore_fuel"]:SetVehicleFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'tam_fuel' then
        Entity(vehicle).state.fuelLevel = fuel_level
        
    elseif ApxConfig.Fuel == 'renewed-fuel' then
        exports['Renewed-Fuel']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'bigdaddy-fuel' then
        exports['BigDaddy-Fuel']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'lc_fuel' then
        exports['lc_fuel']:SetFuel(vehicle, fuel_level)
        
    elseif ApxConfig.Fuel == 'fast-fuel' then
        exports['fast-fuel']:SetFuel(vehicle, fuel_level)

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- NOTIFICATION FUNCTIONS --------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.Notify(message, time, type)
    if ApxConfig.Notification == 'apx_core' then
        SendNUIMessage({
            action = 'open',
            type = type,
            message = message,
            time = time,
        })

    elseif ApxConfig.Notification == 'qbcore' then
        QBCore.Functions.Notify(message, type)

    elseif ApxConfig.Notification == 'esx' then
        ESX.ShowNotification(message)

    elseif ApxConfig.Notification == 'okok' then
        exports['okokNotify']:Alert(title, message, time, type)

    elseif ApxConfig.Notification == 'codem' then
        TriggerEvent('codem-notification:Create', '', type, message, time)

    elseif ApxConfig.Notification == 'mythic' then
        exports[Config.NotificationsResource]:SendAlert(type, message)

    elseif ApxConfig.Notification == 'tgiann' then
        exports["tgiann-lumihud"]:Notif(message, type, time)

    elseif ApxConfig.Notification == 'ox_lib' then
        lib.notify({
            title = '',
            description = message,
            type = type
        })

    end
end

RegisterNetEvent('apx_core:client:notify', function(message, time, type)
	Apx.Functions.Notify(message, time, type)
end)
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- BOSS & GANG MENU FUNCTIONS ----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.Bossmenu()
    if ApxConfig.Bossmenu == 'qb-bossmenu' then
        TriggerEvent('qb-bossmenu:client:OpenMenu')

    elseif ApxConfig.Bossmenu == 'esx_society' then
        TriggerEvent('esx_society:openBossMenu')

    elseif ApxConfig.Bossmenu == 'xboss' then
        TriggerEvent('xboss:OpenMenu')

    end
end
function Apx.Functions.Gangmenu()
    if ApxConfig.Gangmenu == 'qb-bossmenu' then
        TriggerEvent('qb-bossmenu:client:OpenMenu')

    elseif ApxConfig.Gangmenu == 'esx_society' then
        TriggerEvent('esx_society:openBossMenu')

    elseif ApxConfig.Gangmenu == 'xboss' then
        TriggerEvent('xboss:OpenMenu')

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- BILLING FUNCTIONS -------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.OpenBilling()
    if ApxConfig.Payment == 'jim-payments' then
        TriggerEvent('jim-payments:client:Charge')

    elseif ApxConfig.Payment == 'okokBilling' then
        TriggerEvent('okokBilling:ToggleCreateInvoice')

    elseif ApxConfig.Payment == 'tgg-billing' then
        exports['tgg-billing']:OpenBillingMenu()

    elseif ApxConfig.Payment == 's1n_billing' then
        exports['s1n_billing']:openBillingMenu()

    elseif ApxConfig.Payment == 'qs-billing' then

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- WARDROBE FUNCTIONS ------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.WardrobeOpen(job)
    if ApxConfig.Clothing == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:openOutfitMenu')

    elseif ApxConfig.Clothing == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:openOutfitMenu')

    elseif ApxConfig.Clothing == 'crm-appearance' then
        TriggerEvent('crm-appearance:show-outfits')

    elseif ApxConfig.Clothing == 'bl_appearance' then
        exports.bl_appearance:OpenMenu({type = 'outfits'})

    elseif ApxConfig.Clothing == 'rcore_clothes' then
        TriggerEvent('rcore_clothes:openOutfits')

    elseif ApxConfig.Clothing == 'esx_skin' then
        TriggerEvent('esx_skin:openSaveableMenu')
    
    elseif ApxConfig.Clothing == 'tgiann-clothing' then
        TriggerEvent("tgiann-clothing:openOutfitMenu")

    end
end
function Apx.Functions.WardrobeShop(job)
    if ApxConfig.Clothing == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:openMenu')

    elseif ApxConfig.Clothing == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:openClothingShop')

    elseif ApxConfig.Clothing == 'crm-appearance' then
        TriggerEvent('crm-appearance:show-clothing-menu')

    elseif ApxConfig.Clothing == 'bl_appearance' then
        exports.bl_appearance:OpenMenu({type = 'clothing'})

    elseif ApxConfig.Clothing == 'esx_skin' then
        TriggerEvent('esx_skin:openMenu')

    elseif ApxConfig.Clothing == 'tgiann-clothing' then
        exports["tgiann-clothing"]:openMenu({
            allowedMenus = {[0] = false, [1] = true, [2] = false, [3] = false},
            isBerberMenu = false,
        })

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- PROGRESSBAR FUNCTIONS ---------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.Progressbar(data)
    local label = data.label or 'Processing...'
    local duration = data.duration or 5000
    local useWhileDead = data.useWhileDead or false
    local canCancel = data.canCancel ~= false
    local disable = data.disable or {}
    local anim = data.anim or {}
    local prop = data.prop or {}

    if ApxConfig.Progressbar == 'qbcore' then
        local p = promise.new()
        QBCore.Functions.Progressbar(label, label, duration, useWhileDead, canCancel, {
            disableMovement = disable.move or false,
            disableCarMovement = disable.car or false,
            disableMouse = false,
            disableCombat = disable.combat or false,
        }, {
            animDict = anim.dict or nil,
            anim = anim.clip or nil,
            flags = anim.flag or 49
        }, {
            model = prop.model or nil,
            bone = prop.bone or nil,
            coords = prop.pos or nil,
            rotation = prop.rot or nil
        }, {},
        function()
            p:resolve(true)
        end,
        function()
            p:resolve(false)
        end)
        return Citizen.Await(p)

    elseif ApxConfig.Progressbar == 'ox_lib' then
        local result = lib.progressBar({
            label = label,
            duration = duration,
            position = data.position or 'bottom',
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = {
                move = disable.move or false,
                car = disable.car or false,
                combat = disable.combat or false,
            },
            anim = next(anim) and {
                dict = anim.dict or '',
                clip = anim.clip or '',
                flag = anim.flag or 49,
            } or nil,
            prop = next(prop) and {
                model = prop.model or '',
                bone = prop.bone or nil,
                pos = prop.pos or vec3(0, 0, 0),
                rot = prop.rot or vec3(0, 0, 0),
            } or nil
        })

        return result == true

    elseif ApxConfig.Progressbar == 'tgiann' then -- Contributed by: essentiaplus
        local p = promise.new()
        local actions = {
            name = "apx_" .. tostring(math.random(1000, 9999)),
            duration = duration,
            label = label,
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            controlDisables = {
                car = disable.car or false,
                move = disable.move or false,
                combat = disable.combat or false,
                mouse = disable.mouse or false,
                disableRun = disable.disableRun or true
            },
            animation = next(anim) and {
                animDict = anim.dict or '',
                anim = anim.clip or '',
                flags = tostring(anim.flag or 49)
            } or nil,
            prop = next(prop) and {
                model = prop.model or '',
                bone = prop.bone or nil,
                coords = prop.pos or { x = 0.0, y = 0.0, z = 0.0 },
                rotation = prop.rot or { x = 0.0, y = 0.0, z = 0.0 }
            } or nil
        }

        exports["tgiann-lumihud"]:Progress(actions, function(canceled)
            p:resolve(not canceled)
        end)

        return Citizen.Await(p)
    else
        print("[Apx.Functions.Progressbar] Invalid progressbar type configured")
        return false
    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- TARGET FUNCTIONS --------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.AddBoxZone(targetArgs)
    local boxOptions = {
        options = targetArgs.options,
        distance = targetArgs.distance,
    }

    if ApxConfig.Target == 'qb-target' then
        exports['qb-target']:AddBoxZone(targetArgs.name, targetArgs.coords, targetArgs.length, targetArgs.width, {
            name = targetArgs.name,
            heading = targetArgs.heading,
            minZ = targetArgs.minZ,
            maxZ = targetArgs.maxZ,
            debugPoly = targetArgs.debugPoly,
        }, boxOptions)

    elseif ApxConfig.Target == 'qtarget' then
        exports['qtarget']:AddBoxZone(targetArgs.name, targetArgs.coords, targetArgs.length, targetArgs.width, {
            name = targetArgs.name,
            heading = targetArgs.heading,
            minZ = targetArgs.minZ,
            maxZ = targetArgs.maxZ,
            debugPoly = targetArgs.debugPoly,
        }, boxOptions)

    elseif ApxConfig.Target == 'ox_target' then
        local adjustedOptions = {}

        for _, option in ipairs(targetArgs.options) do
            local newOption = option
            newOption.distance = newOption.distance or targetArgs.distance or 2.0
            table.insert(adjustedOptions, newOption)
        end

        exports['ox_target']:addBoxZone({
            coords = vector3(targetArgs.coords.x, targetArgs.coords.y, targetArgs.coords.z - 0.2),
            size = targetArgs.size,
            rotation = targetArgs.rotation + 90,
            debug = targetArgs.debug,
            options = adjustedOptions,
        })
        -- exports['ox_target']:addBoxZone({
        --     coords = vector3(targetArgs.coords.x, targetArgs.coords.y, targetArgs.coords.z-0.2),
        --     size = targetArgs.size,
        --     rotation = targetArgs.rotation+90,
        --     debug = targetArgs.debug,
        --     options = targetArgs.options,
        -- })

    end
end

function Apx.Functions.AddCircleZone(targetArgs)
    local circleOptions = {
        options = targetArgs.options,
        distance = targetArgs.distance,
    }

    if ApxConfig.Target == 'qb-target' then
        exports['qb-target']:AddCircleZone(targetArgs.name, targetArgs.coords, targetArgs.radius, {
            name = targetArgs.name,
            debugPoly = targetArgs.debugPoly,
            useZ=true,
        }, circleOptions)

    elseif ApxConfig.Target == 'qtarget' then
        exports['qtarget']:AddCircleZone(targetArgs.name, targetArgs.coords, targetArgs.radius, {
            name = targetArgs.name,
            debugPoly = targetArgs.debugPoly,
            useZ=true,
        }, circleOptions)

    elseif ApxConfig.Target == 'ox_target' then
        local adjustedOptions = {}

        for _, option in ipairs(targetArgs.options) do
            local newOption = option
            newOption.distance = newOption.distance or targetArgs.distance or 2.0
            table.insert(adjustedOptions, newOption)
        end

        exports['ox_target']:addSphereZone({
            coords = targetArgs.coords,
            radius = targetArgs.radius,
            debug = targetArgs.debug,
            options = adjustedOptions,
            -- distance = targetArgs.distance, -- fjernes, ox_target bruger det ikke her
        })
        -- exports['ox_target']:addSphereZone({
        --     coords = targetArgs.coords,
        --     radius = targetArgs.radius,
        --     debug = targetArgs.debug,
        --     options = targetArgs.options,
        --     distance = targetArgs.distance,
        -- })
    end
end

function Apx.Functions.AddGlobalPlayer(args)
    if ApxConfig.Target == 'qb-target' then
        local playerOptions = {}
        for k,v in pairs(args.options) do
            table.insert(playerOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label, canInteract = v.canInteract})
        end
        exports['qb-target']:AddGlobalPlayer({
            options = playerOptions,
            distance = args.distance,
        })

    elseif ApxConfig.Target == 'qtarget' then
        local playerOptions = {}
        for k,v in pairs(args.options) do
            table.insert(playerOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label, canInteract = v.canInteract})
        end
        exports['qtarget']:AddGlobalPlayer({
            options = playerOptions,
            distance = args.distance,
        })

    elseif ApxConfig.Target == 'ox_target' then
        local playerOptions = {}
        for k,v in pairs(args.options) do
            table.insert(playerOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label, canInteract = v.canInteract})
        end
        exports.ox_target:addGlobalPlayer(args.options)

    end
end

function Apx.Functions.AddGlobalVehicle(args)
    if ApxConfig.Target == 'qb-target' then
        local vehicleOptions = {}
        for k,v in pairs(args.options) do
            table.insert(vehicleOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label})
        end
        exports['qb-target']:AddGlobalVehicle({
            options = vehicleOptions,
            distance = args.distance,
        })

    elseif ApxConfig.Target == 'qtarget' then
        local vehicleOptions = {}
        for k,v in pairs(args.options) do
            table.insert(vehicleOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label})
        end
        exports['qtarget']:AddGlobalVehicle({
            options = vehicleOptions,
            distance = args.distance,
        })

    elseif ApxConfig.Target == 'ox_target' then
        local vehicleOptions = {}
        for k,v in pairs(args.options) do
            table.insert(vehicleOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label})
        end
        exports.ox_target:addGlobalVehicle(args.options)

    end
end

function Apx.Functions.AddTargetModel(args)
    if ApxConfig.Target == 'qb-target' then
        local targetOptions = {}
        for k,v in pairs(args.options) do
            table.insert(targetOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label})
        end
        exports['qb-target']:AddTargetModel(args.models, {
            options = targetOptions,
            distance = args.distance,
        })

    elseif ApxConfig.Target == 'qtarget' then
        local targetOptions = {}
        for k,v in pairs(args.options) do
            table.insert(targetOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label})
        end
        exports['qtarget']:AddTargetModel(args.models, {
            options = targetOptions,
            distance = args.distance,
        })

    elseif ApxConfig.Target == 'ox_target' then
        local targetOptions = {}
        for k,v in pairs(args.options) do
            table.insert(targetOptions, {type = v.type, event = v.event or nil, icon = v.icon, label = v.label})
        end
        exports.ox_target:addModel(args.models, args.options)

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- INVENTORY FUNCTIONS -----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.OpenShop(invType, label, items)
    if ApxConfig.Inventory == 'qb-inventory' or ApxConfig.Inventory == 'qs-inventory' then
        TriggerServerEvent('inventory:server:OpenInventory', invType, label, items)

    elseif ApxConfig.Inventory == 'ox_inventory' then
        exports.ox_inventory:openInventory(invType, label, items)

    elseif ApxConfig.Inventory == 'codem-inventory' then
        TriggerServerEvent('codem-inventory:OpenInventory', invType, label, nil, nil)

    elseif ApxConfig.Inventory == 'core_inventory' then
        TriggerServerEvent('core_inventory:server:openInventory', label, invType)

    end
end

function Apx.Functions.OpenInventory(invType, id, label, slots, weight)
    if ApxConfig.Inventory == 'qb-inventory' or ApxConfig.Inventory == 'qs-inventory' then
        TriggerServerEvent('inventory:server:OpenInventory', invType, id, { maxweight = weight, slots = slots })
        TriggerEvent('inventory:client:SetCurrentStash', id)

    elseif ApxConfig.Inventory == 'ox_inventory' then
        exports.ox_inventory:openInventory(invType, id)

    elseif ApxConfig.Inventory == 'codem-inventory' then
        TriggerServerEvent('inventory:server:OpenInventory', invType, label, { maxweight = weight, slots = slots })

    elseif ApxConfig.Inventory == 'tgiann-inventory' then
        exports["tgiann-inventory"]:OpenInventory(invType, id, { maxweight = weight, slots = slots }, null)

    elseif ApxConfig.Inventory == 'core_inventory' then
        TriggerServerEvent('core_inventory:server:openInventory', label, invType)

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- CARKEY FUNCTIONS --------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.Keylock(plate, model)
    if ApxConfig.Keylock == 'qb-vehiclekeys' then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)

    elseif ApxConfig.Keylock == 'qs-vehiclekeys' then
        exports['qs-vehiclekeys']:GiveKeys(plate, model)

    elseif ApxConfig.Keylock == 'wasabi_carlock' then
        exports.wasabi_carlock:GiveKey(plate)

    elseif ApxConfig.Keylock == 'jaksam-vehiclekeys' then
        TriggerServerEvent('vehicles_keys:selfGiveVehicleKeys', plate)

    elseif ApxConfig.Keylock == 'F_RealCarKeysSystems' then
        TriggerServerEvent('F_RealCarKeysSystem:generateVehicleKeys', plate)

    elseif ApxConfig.Keylock == 'fivecode_carkeys' then
        TriggerServerEvent('fivecode_carkeys:pdmGiveKey', plate)

    elseif ApxConfig.Keylock == 'stasiek_vehiclekeys' then
        DecorSetInt(model, 'owner', GetPlayerServerId(PlayerId()))

    elseif ApxConfig.Keylock == 't1ger_keys' then
        TriggerServerEvent('t1ger_keys:giveCopyKeys', plate, model, GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId())))

    elseif ApxConfig.Keylock == 'ti_vehicleKeys' then
        exports['ti_vehicleKeys']:addTemporaryVehicle(plate)

    elseif ApxConfig.Keylock == 'vehicles_keys' then
        TriggerServerEvent('vehicles_keys:selfGiveVehicleKeys', plate)

    elseif ApxConfig.Keylock == 'xd_locksystem' then
        exports['xd_locksystem']:givePlayerKeys(plate)

    elseif ApxConfig.Keylock == 'MrNewbVehicleKeys' then
        exports.MrNewbVehicleKeys:GiveKeys(plate)

    elseif ApxConfig.Keylock == 'tgiann-hotwire' then
        exports["tgiann-hotwire"]:GiveKeyPlate(plate, true)

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- TEXTUI FUNCTIONS --------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.TextUIShow(text, type)
    if ApxConfig.TextUI == 'apx_core' then
        if not type then type = 'info' end
        SendNUIMessage({
            type = 'open',
            text = text,
            color = type,
        })

    elseif ApxConfig.TextUI == 'qbcore' then
        exports['qb-core']:DrawText(text, 'left')

    elseif ApxConfig.TextUI == 'qbx' then
        lib.showTextUI(text, { position = 'left' })

    elseif ApxConfig.TextUI == 'ox_lib' then
        lib.showTextUI(text)

    elseif ApxConfig.TextUI == 'codem-textui' then
        exports['codem-textui']:OpenTextUI(text, type)

    end
end
function Apx.Functions.TextUIHide(type)
    if ApxConfig.TextUI == 'apx_core' then
        type = type and type or 'info'
        SendNUIMessage({
            type = 'close',
            text = {},
            color = type,
        })

    elseif ApxConfig.TextUI == 'qbcore' then
        exports['qb-core']:HideText()

    elseif ApxConfig.TextUI == 'qbx' then
        lib.hideTextUI()

    elseif ApxConfig.TextUI == 'ox_lib' then
        lib.hideTextUI()

    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- LOAD FUNCTIONS ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.LoadAnim(animDict)
    RequestAnimDict(animDict); while not HasAnimDictLoaded(animDict) do Citizen.Wait(1) end
end
function Apx.Functions.LoadModel(model)
    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)

        while not HasModelLoaded(model) do
            Wait(0)
        end
    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- DEBUGS ------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
CreateThread(function()
    if ApxConfig.Debug == true then
        -- Active Settings --
        print('Active Settings:')
        print('Framework:       '..ApxConfig.Framework)
        print('ResourceName:    '..ApxConfig.ResourceName)
        print('Bossmenu:        '..ApxConfig.Bossmenu)
        print('Target:          '..ApxConfig.Target)
        print('Inventory:       '..ApxConfig.Inventory)
        print('Progressbar:     '..ApxConfig.Progressbar)
        print('Notification:    '..ApxConfig.Notification)
        print('Payment:         '..ApxConfig.Payment)
        print('Clothing:        '..ApxConfig.Clothing)
        print('Phone:           '..ApxConfig.Phone)
        print('Fuel:            '..ApxConfig.Fuel)
        print('Garage:          '..ApxConfig.Garage)
        print('Keylock:         '..ApxConfig.Keylock)
        print('TextUI:          '..ApxConfig.TextUI)

        -- Notifications --
        RegisterCommand('testnotifications', function()
            Apx.Functions.Notify('This is a successfull message', 5000, 'success')
            Apx.Functions.Notify('I like to inform you', 5000, 'info')
            Apx.Functions.Notify('You are going the wrong way', 5000, 'error')
            Apx.Functions.Notify('Warning, danger ahead', 5000, 'warning')
        end)

        -- Text UI --
        RegisterCommand('TextUIShow', function()
            Apx.Functions.TextUIShow('[E] - Action', 'classic')
        end)

        RegisterCommand('TextUIHide', function()
            Apx.Functions.TextUIHide()
        end)
    end
end)

