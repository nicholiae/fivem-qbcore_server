local General = require 'config.general'

RegisterCommand("+startPetActions", function()
    startPetActions()
end, false)

RegisterCommand("-startPetActions", function()
    return true
end, false)

RegisterCommand("+startPetActionsWithoutCoords", function()
    openPetActions()
end, false)

RegisterCommand("-startPetActionsWithoutCoords", function()
    return true
end, false)

Citizen.CreateThread(function()
    if General.binds.enabled then
        RegisterKeyMapping("+startPetActions", General.binds.action.text, "keyboard", General.binds.action.defaultBind)
        RegisterKeyMapping("+startPetActionsWithoutCoords", General.binds.actionWithoutSelection.text, "keyboard",
            General.binds.actionWithoutSelection.defaultBind)
    end
end)
