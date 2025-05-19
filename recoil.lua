EnablePrimaryMouseButtonEvents(true)

-- Two weapon definitions
local selectedGun1 = "VigilBOSGSMG"
local selectedGun2 = "AmaruSMG11_Smoke_Mute_Solis"
local activeGunIndex = 1
local selectedGun = selectedGun1

-- All weapon values
local guns = {
    ["Ash"] = {-1.00, 17.00},
    ["AshHolo"] = {-0.68, 7.00},
    ["TwitchFamas"] = {-1.30, 25.00},
    ["FuzeAce"] = {-1.12, 19.00},
    ["DeimosPistol"] = {-0.47, 8.00},
    ["DeimosSilah"] = {-0.82, 13.20},
    ["Valkyrie"] = {-0.30, 7.50},
    ["AzamiSMG_Kapkan"] = {-0.5, 8.37},
    ["AlibiSMG"] = {0.75, 6.5},
    ["IQ_Grim"] = {-0.60, 11.50},
    ["Capitao_Brava"] = {-0.50, 16.40},
    ["Buck"] = {-0.7, 18.20},
    ["Gridlock_Zero"] = {-0.7, 16.20},
    ["Hibana_Maverick_Nomad_Striker"] = {-0.82, 14.00},
    ["Jackal"] = {-1, 21.00},
    ["JackalSMG"] = {-0.60, 18.20},
    ["ZofiaLMG"] = {-1.18, 20.00},
    ["ZofiaNormal"] = {0.65, 19.00},
    ["Dokka"] = {-0.35, 6.00},
    ["Lion"] = {-0.20, 14.10},
    ["AmaruSMG11_Smoke_Mute_Solis"] = {-0.15, 14.00},
    ["AmaruNormal"] = {-0.9, 17.20},
    ["Tubaro"] = {0, 16.00},
    ["Nokk"] = {1, 18.50},
    ["Ying"] = {0, 18.00},
    ["Sledge_Thatcher"] = {0.7, 15.30},
    ["Kalismg_Echosmg"] = {-0.3, 11.80},
    ["Bandit_Fenrir"] = {0.1, 6.50},
    ["AlibiDMR_AzamiDMR"] = {0, 7.00},
    ["Skopos"] = {-0.35, 6.90},
    ["Iana"] = {1.20, 17.50},
    ["Flores"] = {-0.88, 15.00},
    ["Ram"] = {-1.35, 23.00},
    ["Castle"] = {-0.71, 12.00},
    ["Frost"] = {0.1, 11.80},
    ["Pulse"] = {-0.34, 3.80},
    ["TwitchDMR"] = {-0.14, 5.10},
    ["Echo"] = {-0.30, 7.40},
    ["Mira"] = {-0.23, 9.20},
    ["Lesion_Oryx"] = {-0.23, 9.20},
    ["Ela"] = {1.85, 7.80},
    ["VigilBOSGSMG"] = {1.00, 12.00},
    ["Kaid"] = {-1.00, 32.00},
    ["Goyo"] = {-0.90, 27.30},
    ["Sens"] = {0, 18.00},
    ["Blackbeard"] = {0.6, 9.00},
    ["CavSilah"] = {-0.25, 4.10},
    ["CavPistol"] = {1.20, 7.60},
    ["Aruni"] = {-1.00, 12.00},
    ["Jager"] = {-0.55, 7.70},
    ["Sentry_Mozzie"] = {0, 6.70}
}

function moveWithFraction(x, y)
    local xWhole = math.floor(x)
    local yWhole = math.floor(y)
    local xFrac = x - xWhole
    local yFrac = y - yWhole
    local xRemainder = 0
    local yRemainder = 0

    return function()
        xRemainder = xRemainder + xFrac
        yRemainder = yRemainder + yFrac

        local moveX = xWhole
        local moveY = yWhole

        if xRemainder >= 1 then
            moveX = moveX + 1
            xRemainder = xRemainder - 1
        end
        if yRemainder >= 1 then
            moveY = moveY + 1
            yRemainder = yRemainder - 1
        end

        MoveMouseRelative(moveX, moveY)
    end
end

function OnEvent(event, arg)
    -- Switch weapons with Mouse5
    if event == "MOUSE_BUTTON_PRESSED" and arg == 5 then
        if activeGunIndex == 1 then
            activeGunIndex = 2
            selectedGun = selectedGun2
        else
            activeGunIndex = 1
            selectedGun = selectedGun1
        end
        OutputLogMessage("Seçilen silah: %s\n", selectedGun)
    end

    -- Recoil (CapsLock on + Right click + Left click)
    if IsKeyLockOn("capslock") and IsMouseButtonPressed(3) and event == "MOUSE_BUTTON_PRESSED" and arg == 1 then
        local gun = guns[selectedGun]
        if gun then
            local mover = moveWithFraction(gun[1], gun[2])
            repeat
                mover()
                Sleep(1)
            until not IsMouseButtonPressed(1)
        end
    end
end
