SetRelationshipBetweenGroups(1, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_1`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_2`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_9`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_10`, `PLAYER`)
SetRelationshipBetweenGroups(1, `FIREMAN`, `PLAYER`)
SetRelationshipBetweenGroups(1, `MEDIC`, `PLAYER`)
SetRelationshipBetweenGroups(1, `COP`, `PLAYER`)
SetRelationshipBetweenGroups(1, `PRISONER`, `PLAYER`)

local config = lib.load('config.client')

local function setDensity(type, value)
    if type == 'parked' then
        config.parked = value
    elseif type == 'vehicle' then
        config.vehicle = value
    elseif type == 'randomvehicles' then
        config.randomvehicles = value
    elseif type == 'peds' then
        config.peds = value
    elseif type == 'scenario' then
        config.scenario = value
    end
end

exports('SetDensity', setDensity)

CreateThread(function()
    while true do
        SetParkedVehicleDensityMultiplierThisFrame(config.parked)
        SetVehicleDensityMultiplierThisFrame(config.vehicle)
        SetRandomVehicleDensityMultiplierThisFrame(config.randomvehicles)
        SetPedDensityMultiplierThisFrame(config.peds)
        SetScenarioPedDensityMultiplierThisFrame(config.scenario, config.scenario) -- Walking NPC Density
        Wait(0)
    end
end)

CreateThread(function()
    for x = 1, #config.removeVehiclesFromGeneratorsInArea do
        local coords = config.removeVehiclesFromGeneratorsInArea[x]
        RemoveVehiclesFromGeneratorsInArea((coords.x1 - 300.0), (coords.y1 - 300.0), (coords.z1 - 300.0), (coords.x2 + 300.0), (coords.y2 + 300.0), (coords.z2 + 300.0))
    end
end)