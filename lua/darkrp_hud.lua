-- Created by Feuille de lune
-- Version : 1.0
-- lua/darkrp_hud.lua

local currentHealth = 100
local currentArmor  = 0
local currentHunger = 100

local iconHealth = Material("darkrp_hud/heart.png",  "noclamp smooth")
local iconArmor  = Material("darkrp_hud/armor.png",  "noclamp smooth")
local iconHunger = Material("darkrp_hud/hunger.png", "noclamp smooth")
local iconId     = Material("darkrp_hud/id.png",     "noclamp smooth")
local iconMoney  = Material("darkrp_hud/money.png",  "noclamp smooth")
local iconJob    = Material("darkrp_hud/job.png",    "noclamp smooth")

local elementsToHide = {
    "DarkRP_HUD",
    "CHudHealth",
    "CHudBattery",
    "DarkRP_Hungermod",
}

hook.Add("HUDShouldDraw", "DarkRPHUD", function(name)
    for _, element in pairs(elementsToHide) do
        if name == element then
            return false
        end
    end
end)

local avatar

hook.Add("InitPostEntity", "Avatar", function()
    avatar = vgui.Create("AvatarImage")
    avatar:SetSize(110, 110)
    avatar:SetPlayer(LocalPlayer(), 64)
end)

surface.CreateFont("ArialText", {
    font = "Arial",
    size = 21,
})

surface.CreateFont("GadugiNumber", {
    font = "Gadugi",
    size = 21,
})

hook.Add("HUDPaint", "HUD", function()
    local cfg = DarkRPHUD.Config
    local x = 7
    local y = ScrH() - 207

    local Health = LocalPlayer():Health()
    local Armor  = LocalPlayer():Armor()
    local Hunger = LocalPlayer():getDarkRPVar("Energy") or 0
    local Name   = LocalPlayer():Nick()
    local Job    = LocalPlayer():getDarkRPVar("job") or ""
    local Money  = LocalPlayer():getDarkRPVar("money")

    currentHealth = Lerp(FrameTime() * 5, currentHealth, Health)
    currentArmor  = Lerp(FrameTime() * 5, currentArmor,  Armor)
    currentHunger = Lerp(FrameTime() * 5, currentHunger, Hunger)

    -- Frame
    draw.RoundedBox(0, x, y, 400, 200, cfg.FrameColor)

    -- Health
    draw.RoundedBox(0, x + 40, y + 130, currentHealth * 3.43, 16, cfg.HealthColor)
    surface.SetMaterial(iconHealth)
    surface.SetDrawColor(cfg.HealthColor)
    surface.DrawTexturedRect(x + 15, y + 130, 18, 18)

    -- Armor
    draw.RoundedBox(0, x + 40, y + 152, currentArmor * 3.43, 16, cfg.ArmorColor)
    surface.SetMaterial(iconArmor)
    surface.SetDrawColor(cfg.ArmorColor)
    surface.DrawTexturedRect(x + 15, y + 152, 18, 18)

    -- Hunger
    draw.RoundedBox(0, x + 40, y + 176, currentHunger * 3.43, 16, cfg.HungerColor)
    surface.SetMaterial(iconHunger)
    surface.SetDrawColor(cfg.HungerColor)
    surface.DrawTexturedRect(x + 15, y + 176, 18, 18)

    -- Name
    draw.SimpleText(Name, "ArialText", x + 175, y + 21, cfg.NameColor)
    surface.SetMaterial(iconId)
    surface.SetDrawColor(cfg.NameColor)
    surface.DrawTexturedRect(x + 142, y + 21, 22, 22)

    -- Job
    draw.SimpleText(Job, "ArialText", x + 175, y + 56, cfg.JobColor)
    surface.SetMaterial(iconJob)
    surface.SetDrawColor(cfg.JobColor)
    surface.DrawTexturedRect(x + 142, y + 56, 22, 22)

    -- Money
    draw.SimpleText(Money .. " $", "GadugiNumber", x + 175, y + 90, cfg.MoneyColor)
    surface.SetMaterial(iconMoney)
    surface.SetDrawColor(cfg.MoneyColor)
    surface.DrawTexturedRect(x + 142, y + 90, 22, 22)

    if avatar then
        avatar:SetPos(x + 12, y + 12)
        avatar:SetVisible(true)
    end
end)