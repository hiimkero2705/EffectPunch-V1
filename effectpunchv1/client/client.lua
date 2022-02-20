Framework = nil

Citizen.CreateThread(function()
    while Framework == nil do
        TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
        Citizen.Wait(0)
    end
end)

local startfashion = false

RegisterNetEvent("fashion:smokepurplepunchv2")
AddEventHandler("fashion:smokepurplepunchv2", function()
    if not startfashion then
        startfashion = true
        TriggerEvent('esx_inventoryhud:closeInventory')
    else
        startfashion = false
        TriggerEvent('esx_inventoryhud:closeInventory')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config['Time'])
        if startfashion then
            local particleDictionary = "scr_rcbarry2"
            local particleName = "scr_clown_death"

            RequestNamedPtfxAsset(particleDictionary)

            while not HasNamedPtfxAssetLoaded(particleDictionary) do
                Citizen.Wait(0)
            end
            
            bone = GetPedBoneIndex(GetPlayerPed(-1), 18905)

            SetPtfxAssetNextCall(particleDictionary)
            effect1 = 
                    StartNetworkedParticleFxNonLoopedOnPedBone(particleName, PlayerPedId(), 0.05, -0.0000, 0.0000, 0.0, 180.0, 0.0, 57005, Config['Scale'], false, false, false)
                    SetPtfxAssetNextCall(particleDictionary)

            effect2 = StartNetworkedParticleFxNonLoopedOnPedBone(particleName, PlayerPedId(), 0.15, -0.0000, 0.0000, 0.0, 180.0, 0.0, 18905, Config['Scale'], false, false, false)
        end
    end
end)
