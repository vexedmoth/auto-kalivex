# auto-kalivex

```

                           __                __  __  
 _   _____  _  _____  ____/ /___ ___  ____  / /_/ /_ 
| | / / _ \| |/_/ _ \/ __  / __ `__ \/ __ \/ __/ __ \ 
| |/ /  __/>  </  __/ /_/ / / / / / / /_/ / /_/ / / /
|___/\___/_/|_|\___/\__,_/_/ /_/ /_/\____/\__/_/ /_/  github.com/vexedmoth
                                                     
```
> [!NOTE]  
> This is an auto installation of Kali Linux for Pentesting and Offensive Security. You need to install a clean Kali Linux system before executing this

## Installation
1. Update and upgrade packages

```shell
sudo apt update && sudo apt upgrade -y
```

2. Clone this repo, grant permissions and execute the script

```shell
git clone https://github.com/vexedmoth/auto-kalivex.git
cd auto-kalivex
chmod +x autoinstall.sh
./autoinstall.sh
```

3. After the installation, the system will be rebooted. Then, select `bspwm` as the window manager and log in

4. Then, run `nvim` and type this after `lazy.nvim` finishes downloading plugins:
```vim
:MasonInstallAll
```
