customActions = {}

customActions.wander = function(pet, config, selected, state)
    state = not state

    changeState("wander", state)

    if state then
        ClearPedTasks(NetToPed(pet))

        local coords = GetEntityCoords(NetToPed(pet), true)
        TaskWanderStandard(NetToPed(pet), 10.0, 10)
        SetPedKeepTask(NetToPed(pet), true)

        return
    end

    ClearPedTasks(NetToPed(pet))
end
