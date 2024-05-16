# auto-kalivex
> Auto installation of Kali Linux for Pentesting and Offensive Security

```

                           __                __  __  
 _   _____  _  _____  ____/ /___ ___  ____  / /_/ /_ 
| | / / _ \| |/_/ _ \/ __  / __ `__ \/ __ \/ __/ __ \ 
| |/ /  __/>  </  __/ /_/ / / / / / / /_/ / /_/ / / /
|___/\___/_/|_|\___/\__,_/_/ /_/ /_/\____/\__/_/ /_/  github.com/vexedmoth
                                                     

```

## Installation
1. Update and upgrade packages

```shell
sudo apt update && sudo apt upgrade -y
```

2. Clone this repo, grant permissions and execute the script

```shell
git clone https://github.com/vexedmoth/auto-kalivex.git
cd auto-kalivex
chmod +x setup.sh
./setup.sh
```

3. After the installation, the system will be rebooted. Then, select `bspwm` as the window manager and log in

4. Then, run `nvim` and type this after `lazy.nvim` finishes downloading plugins:
```vim
:MasonInstallAll
```
