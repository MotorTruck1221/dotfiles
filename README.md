# MotorTruck1221's Dotfiles
---
## Pictures
<p align="center">
    <img src="./.github/assets/1.png" /> <br>
    <img src="./.github/assets/2.png" /> <br>
    <img src="./.github/assets/3.png" /> <br>
    <img src="./.github/assets/4.png" /> <br>
</p>
---
## Layout
 - [flake.nix](./flake.nix) - Flake to get everything kicked off
 - [base.nix](./base.nix) - All of the base programs that are required on ALL systems
 - [systems/](./systems/) - Per system config
    - [voltex](./sytstems/voltex) - My main PC/Laptop
    - [devinka](./systems/devinka) - My home server
- [modules](./modules) - Modularized configs
    - [core](./modules/core) - Core config, may move base.nix here
    - [desktops](./modules/desktops) - Dektop based config
    - [server](./modules/servers) - A mor minimal server based setup
- [secrets](./secrets) - Stored secrets using [agenix](https://github.com/ryantm/agenix)
- [config](./config) - General dotfile config files, slowly this is going to be moved to the [modules](./modules) folder :p
- [wallpapers](./wallpapers) - All of my wallpapers as a **submodule** due to it being over 4GB's in size
---
## About

- WM - [river](https://codeberg.org/river/river)
- Bar - [waybar](https://github.com/Alexays/wayber) - Will be switched to [eww](https://github.com/elkowar/eww) at some point

