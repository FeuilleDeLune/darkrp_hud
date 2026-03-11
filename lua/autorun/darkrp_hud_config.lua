-- Created by Feuille de lune
-- Version : 1.0
-- lua/autorun/hud_loader.lua

if CLIENT then
    include("darkrp_hud.lua")
end

DarkRPHUD = {
    Config = {

        FrameColor  = Color(25, 25, 25),

        HealthColor = Color(255, 60, 60),

        ArmorColor  = Color(0, 63, 191),

        HungerColor = Color(247, 160, 0),

        NameColor   = Color(255, 255, 255),

        JobColor    = Color(160, 110, 60),

        MoneyColor  = Color(60, 200, 0),
    }
}