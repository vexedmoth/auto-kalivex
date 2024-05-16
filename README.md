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

2. Clone this repository

```shell
git clone https://github.com/vexedmoth/auto-kalivex
cd auto-kalivex
```

3. Grant execution permissions to the script.

```shell
chmod +x setup.sh
```

4. Execute the script.

```shell
./setup.sh
```

5. After the script has finished, you will be prompted to restart the system. Once you have rebooted, select `bspwm` as the window manager and then log in.
