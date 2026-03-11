# darkrp_hud

A clean and minimal custom HUD for **DarkRP**, positioned in the bottom-left corner of the screen.

## Features

- 🖼️ **Steam profile picture**
- ❤️ **Health bar** with smooth lerp animation
- 🛡️ **Armor bar** with smooth lerp animation
- 🍗 **Hunger bar** with smooth lerp animation
- 💰 **Money** display
- 💼 **Job** display
- 🎨 **Fully customizable colors** via `cl_hud_loader.lua`

## Installation

1. Download or clone this repository
2. Place the `darkrp_hud` folder into `garrysmod/addons/`
3. Make sure the structure looks like this:

```
garrysmod/addons/darkrp_hud/
    addon.json
    lua/
        autorun/
            client/
                cl_hud_loader.lua
        darkrp_hud/
            darkrp_hud.lua
    materials/
        darkrp_hud/
            heart.png
            armor.png
            hunger.png
            id.png
            money.png
            job.png
```

4. Launch Garry's Mod and join a DarkRP server

## Configuration

Open `lua/autorun/client/cl_hud_loader.lua` to customize the colors :

```lua
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
```

## Requirements

- [DarkRP](https://github.com/FPtje/DarkRP) gamemode
- DarkRP hunger mod enabled for the hunger bar

## License

This project is open source and free to use.