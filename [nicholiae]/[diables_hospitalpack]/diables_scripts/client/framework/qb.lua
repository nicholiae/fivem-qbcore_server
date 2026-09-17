CreateThread(function()
    if Config.framework ~= 'QB' then return end
    QBCore = exports['qb-core']:GetCoreObject()
    
    PlayerData = QBCore.Functions.GetPlayerData()
	
-- ReUpdatePlayerData
	
	function UpdatePlayerData()
        PlayerData = QBCore.Functions.GetPlayerData()
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
        if PlayerData and PlayerData.job and PlayerData.job.grade.level then
            return PlayerData.job.grade.level
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

-- GetPlayer character.lastname, character.firstname

	function GetPlayerCharInfo()
        UpdatePlayerData()
        if PlayerData and PlayerData.charinfo then
            return PlayerData.charinfo
        end
        return nil
    end

end)