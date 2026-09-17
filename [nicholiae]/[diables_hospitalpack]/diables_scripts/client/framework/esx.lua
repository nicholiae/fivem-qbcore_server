CreateThread(function()
    if Config.framework ~= 'ESX' then return end
    ESX = exports['es_extended']:getSharedObject()

    local PlayerData = ESX.GetPlayerData()

-- ReUpdatePlayerData

    function UpdatePlayerData()
        PlayerData = ESX.GetPlayerData()
    end
	
-- 	GetPlayerJobName

    function GetPlayerJobName()
        UpdatePlayerData()
        if PlayerData and PlayerData.job and PlayerData.job.name then
            return PlayerData.job.name
        end
        return nil
    end

-- 	GetPlayerJobGrade

    function GetPlayerJobGrade()
        UpdatePlayerData()
        if PlayerData and PlayerData.job and PlayerData.job.grade then
            return PlayerData.job.grade
        end
        return nil
    end

-- GetPlayerData

    function GetPlayerData(callback)
        UpdatePlayerData()
        if callback ~= nil then
            callback(PlayerData)
        end
    end

    local callback = nil

-- GetPlayer character.lastname, character.firstname

    function GetPlayerCharInfo(cb)
        callback = cb
        UpdatePlayerData()
        local identifier = PlayerData.identifier
    end

end)

