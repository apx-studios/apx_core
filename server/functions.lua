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
-- NOTIFICATION FUNCTIONS --------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.Notify(source, message, time, type)
    local src = source
    TriggerClientEvent('apx_core:client:notify', src, message, time, type)
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- INVENTORY FUNCTIONS -----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.AddItem(source, item, amount)
    if ApxConfig.Inventory == 'qb-inventory' then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
        exports['qb-inventory']:AddItem(source, item, amount)
        
    elseif ApxConfig.Inventory == 'qs-inventory' then
        exports['qs-inventory']:AddItem(source, item, amount)
        
    elseif ApxConfig.Inventory == 'ox_inventory' then
        exports.ox_inventory:AddItem(source, item, amount)
        
    elseif ApxConfig.Inventory == 'codem-inventory' then
        exports['codem-inventory']:AddItem(source, item, amount)

    elseif ApxConfig.Inventory == 'tgiann-inventory' then
        exports["tgiann-inventory"]:AddItem(source, item, amount)
        
    elseif ApxConfig.Inventory == 'origen_inventory' then
        exports.origen_inventory:AddItem(source, item, amount)

    elseif ApxConfig.Inventory == 'core_inventory' then
        exports.core_inventory:addItem(source, item, amount)
        
    end
end

function Apx.Functions.RemoveItem(source, item, amount)
    if ApxConfig.Inventory == 'qb-inventory' then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
        exports['qb-inventory']:RemoveItem(source, item, amount)
        
    elseif ApxConfig.Inventory == 'qs-inventory' then
         exports['qs-inventory']:RemoveItem(source, item, amount)
         
    elseif ApxConfig.Inventory == 'ox_inventory' then
        exports.ox_inventory:RemoveItem(source, item, amount)
        
    elseif ApxConfig.Inventory == 'codem-inventory' then
        exports['codem-inventory']:RemoveItem(source, item, amount)

    elseif ApxConfig.Inventory == 'tgiann-inventory' then
        exports["tgiann-inventory"]:RemoveItem(source, item, amount)
        
    elseif ApxConfig.Inventory == 'origen_inventory' then
        exports.origen_inventory:RemoveItem(source, item, amount, slot)

    elseif ApxConfig.Inventory == 'core_inventory' then
        exports.core_inventory:removeItem(source, item, amount)
        
    end
end

function Apx.Functions.HasItem(source, item, count)
    local hasItem = false

    if ApxConfig.Inventory == 'qb-inventory' then
        local Player = QBCore.Functions.GetPlayer(source)
        local playerItem = Player.Functions.GetItemByName(item)
        if playerItem and playerItem.amount >= count then
            hasItem = true
        end
        
        hasItem = exports['qb-inventory']:HasItem(source, item, count)

    elseif ApxConfig.Inventory == 'qs-inventory' then
        local totalAmount = exports['qs-inventory']:GetItemTotalAmount(source, item)
        if totalAmount >= count then
            hasItem = true
        end

    elseif ApxConfig.Inventory == 'ox_inventory' then
        local playerItem = exports.ox_inventory:GetItem(source, item)
        if playerItem and playerItem.count >= count then
            hasItem = true
        end

    elseif ApxConfig.Inventory == 'codem-inventory' then
        hasItem = exports['codem-inventory']:HasItem(source, item, count)

    elseif ApxConfig.Inventory == 'tgiann-inventory' then
        hasItem = exports["tgiann-inventory"]:HasItem(source, item, count)

    elseif ApxConfig.Inventory == 'origen_inventory' then
        hasItem = exports.origen_inventory:HasItem(source, item, count)

    elseif ApxConfig.Inventory == 'core_inventory' then
        exports.core_inventory:hasItem(source, item, count)

    end

    return hasItem
end

function Apx.Functions.ClearInventory(source)
    if ApxConfig.Inventory == 'qb-inventory' then
        exports['qb-inventory']:ClearInventory(source)
        
    elseif ApxConfig.Inventory == 'qs-inventory' then
         exports['qs-inventory']:ClearInventory(source)
         
    elseif ApxConfig.Inventory == 'ox_inventory' then
        exports.ox_inventory:ClearInventory(source)
        
    elseif ApxConfig.Inventory == 'codem-inventory' then
        exports['codem-inventory']:ClearInventory(source)

    elseif ApxConfig.Inventory == 'tgiann-inventory' then
        exports["tgiann-inventory"]:ClearInventory(source)
        
    elseif ApxConfig.Inventory == 'origen_inventory' then
        exports.origen_inventory:ClearInventory(source)

    elseif ApxConfig.Inventory == 'core_inventory' then
        exports.core_inventory:clearAllInventory(source)
        
    end
end
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- SCRIPT VERSION CHECK ----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function Apx.Functions.Version()
    local resource = GetInvokingResource()
    Wait(2000)
    local function ToNumber(apx) return tonumber(apx) end
    local current_version = GetResourceMetadata(resource, 'version', 0)
    PerformHttpRequest('https://raw.githubusercontent.com/apx-studios/apx_versions/master/'..resource..'.txt',function(error, result, headers)
        if not result then print('^1Version check disabled because github is down.^0') return end
        local result = json.decode(result:sub(1, -2))
        if ToNumber(result.version:gsub('%.', '')) > ToNumber(current_version:gsub('%.', '')) then
            local symbols = '^'..math.random(1,9)
            for apx = 1, 26+#resource do
                symbols = symbols..'='
            end
            symbols = symbols..'^0'
            print(symbols)
            print('^2['..resource..'] - New Update Available.^0\nCurrent Version: ^5'..current_version..'^0.\nNew Version: ^5'..result.version..'^0.\nNotes: ^5'..result.notes..'^0.\n\n^5Download it now on your keymaster.fivem.net^0.')
            print(symbols)
        end
    end,'GET')
end
----------------------------------------------------------------------------------------------------
-- CORE VERSION CHECK ------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
CreateThread(function()
    local resource = 'apx_core'
    Wait(2000)
    local function ToNumber(apx) return tonumber(apx) end
    local current_version = GetResourceMetadata(resource, 'version', 0)
    PerformHttpRequest('https://raw.githubusercontent.com/apx-studios/apx_versions/master/'..resource..'.txt',function(error, result, headers)
        if not result then print('^1Version check disabled because github is down.^0') return end
        local result = json.decode(result:sub(1, -2))
        if ToNumber(result.version:gsub('%.', '')) > ToNumber(current_version:gsub('%.', '')) then
            local symbols = '^'..math.random(1,9)
            for apx = 1, 26+#resource do
                symbols = symbols..'='
            end
            symbols = symbols..'^0'
            print(symbols)
            print('^2['..resource..'] - New Update Available.^0\nCurrent Version: ^5'..current_version..'^0.\nNew Version: ^5'..result.version..'^0.\nNotes: ^5'..result.notes..'^0.\n\n^5Download it now on your keymaster.fivem.net^0.')
            print(symbols)
        end
    end,'GET')
end)
----------------------------------------------------------------------------------------------------