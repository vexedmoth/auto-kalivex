#!/usr/bin/bash

# github.com/vexedmoth
#                           __                __  __  
# _   _____  _  _____  ____/ /___ ___  ____  / /_/ /_ 
#| | / / _ \| |/_/ _ \/ __  / __ `__ \/ __ \/ __/ __ \ 
#| |/ /  __/>  </  __/ /_/ / / / / / / /_/ / /_/ / / /
#|___/\___/_/|_|\___/\__,_/_/ /_/ /_/\____/\__/_/ /_/ 
#


# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Global variables
dir=$(pwd)
fdir="$HOME/.local/share/fonts"
user=$(whoami)

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${redColour}[!] Exiting...\n${endColour}"
	exit 1
}

if [ "$user" == "root" ]; then
	echo -e "\n\n${redColour}[!] You should not run the script as the root user!\n${endColour}"
    	exit 1
else
	echo "                              _           _  _                  "
	echo "               _            | |         | |(_)                  "
	echo " _____ _   _ _| |_ ___ _____| |  _ _____| | _ _   _ _____ _   _ "
	echo "(____ | | | (_   _) _ (_____) |_/ |____ | || | | | | ___ ( \ / )"
	echo "/ ___ | |_| | | || |_| |    |  _ (/ ___ | || |\ V /| ____|) X ( "
	echo "\_____|____/   \__)___/     |_| \_)_____|\_)_| \_/ |_____|_/ \_)"

	################### MAIN APT PACKAGES ###################
	sleep 1
	echo -e "\n\n${blueColour}[*] Installing main APT packages for the environment...\n${endColour}"
	sleep 2
	sudo apt install -y alacritty rofi bspwm sxhkd polybar feh ranger i3lock-fancy tty-clock wmname cmatrix htop btop neofetch python3-pip procps fzf bat pamixer flameshot acpi
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install some packages!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	################### MAIN NON APT PACKAGES ###################
	echo -e "\n${blueColour}[*] Starting installation of main packages out of APT package manager...\n${endColour}"
	sleep 0.5

	### exa ###
	echo -e "\n${purpleColour}[*] Installing necessary dependencies for exa...\n${endColour}"
	sleep 2
	sudo apt install -y libgit2-dev rustc
	sudo apt-mark auto rustc
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install some dependencies for exa!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	echo -e "\n${purpleColour}[*] Installing exa...\n${endColour}"
	sleep 2
	git clone https://github.com/ogham/exa --depth=1
	cd exa
	cargo build --release && cargo test #cargo test is optional
	sudo install target/release/exa /usr/local/bin/exa
	sleep 1.5
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install exa!\n${endColour}"
		exit 1
	else
		cd ..
		rm -rf exa
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	### Picom ###
	echo -e "\n${purpleColour}[*] Installing necessary dependencies for picom...\n${endColour}"
	sleep 2
	sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install some dependencies for picom!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	echo -e "\n${purpleColour}[*] Installing picom...\n${endColour}"
	sleep 2
	git clone https://github.com/ibhagwan/picom.git
	cd picom
	git submodule update --init --recursive
	meson --buildtype=release . build
	ninja -C build
	sudo ninja -C build install
	sleep 1.5
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install picom!\n${endColour}"
		exit 1
	else
		cd ..
		rm -rf picom
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	### Ohmyzsh + plugins ###
	echo -e "\n${purpleColour}[*] Installing Oh My Zsh + plugins...\n${endColour}"
	sleep 2
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	sleep 1.5
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install Oh My Zsh + plugins\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	### Starship ###
	echo -e "\n${purpleColour}[*] Installing starship...\n${endColour}"
	sleep 2
	curl -sS https://starship.rs/install.sh | sh -s -- -y
	sleep 1.5
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install starship!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	### Obsidian ###
	echo -e "\n${purpleColour}[*] Installing Obsidian...\n${endColour}"
	sleep 2
	latest_obs_version=$(wget -q -O - https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep 'AppImage"$' | awk -F'"' ' NR==2 {print $4} ')
	curl -L -o obsidian $latest_obs_version
	chmod u+x obsidian
	sudo mv obsidian /usr/bin
	sleep 1.5
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install Obsidian!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	### Nvchad ###
	echo -e "\n${purpleColour}[*] Installing Nvchad...\n${endColour}"
	sleep 2
	latest_nvim_version=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep "nvim-linux64.tar.gz" | awk -F'"' ' {print $4} ' | awk 'NR==2')
	curl -L -o nvim.tar.gz $latest_nvim_version
	tar xzvf nvim.tar.gz
	sudo mv nvim-linux64 /opt/
	sleep 1.5
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install Nvchad!\n${endColour}"
		exit 1
	else
		cd 
		rm -rf nvim.tar.gz
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	################### COPYING FILES ###################
	echo -e "\n${blueColour}[*] Copying fonts, wallpaper, .config files, dotfiles bin backup...\n${endColour}"
	sleep 0.5
	cd

	### dotfiles bin backup ###
	echo -e "\n${purpleColour}[*] Copying dotfiles bin backup...\n${endColour}"
	sleep 2
	if [[ -d "~/.local/bin" ]]; then
		cp -v $dir/dotsup ~/.local/bin
	else
		mkdir -p ~/.local/bin
		cp -v $dir/dotsup ~/.local/bin
	fi
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	### autoinstall.sh ###
	echo -e "\n${purpleColour}[*] Copying autoinstall.sh file...\n${endColour}"
	sleep 2
	cp -v $dir/autoinstall.sh ~/.local/bin
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	### .zshrc ###
	echo -e "\n${purpleColour}[*] Copying .zshrc file...\n${endColour}"
	sleep 2
	cp -v $dir/.zshrc ~/.zshrc
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5
	
	### Fonts ###
	echo -e "\n${purpleColour}[*] Copying fonts...\n${endColour}"
	sleep 2
	if [[ -d "$fdir" ]]; then
		cp -rv $dir/fonts/* $fdir
	else
		mkdir -p $fdir
		cp -rv $dir/fonts/* $fdir
	fi
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	### Wallpapers ###
	echo -e "\n${purpleColour}[*] Copying wallpaper...\n${endColour}"
	sleep 2
	if [[ -d "~/Wallpapers" ]]; then
		cp -rv $dir/Wallpapers/* ~/Wallpapers
	else
		mkdir ~/Wallpapers
		cp -rv $dir/Wallpapers/* ~/Wallpapers
	fi
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	### Rest of the .config ###
	echo -e "\n${purpleColour}[*] Copying .config files...\n${endColour}"
	sleep 2
	cp -rv $dir/.config/* ~/.config/
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	################### SYMBOLIC LINKS ###################
	echo -e "\n${purpleColour}[*] Setting symbolic links...\n${endColour}"
	sleep 2
	sudo mkdir -p /root/.config
	sudo ln -sfv ~/.zshrc /root/.zshrc
	sudo ln -sfv ~/.oh-my-zsh  /root/.oh-my-zsh
	sudo ln -sfv ~/.config/starship.toml  /root/.config/starship.toml
	sudo ln -sfv ~/.config/nvim /root/.config/nvim
	sudo ln -sfv ~/.config/polybar/scripts/target_to_hack/settarget /usr/local/bin/settarget
	sudo ln -sfv ~/.config/polybar/scripts/target_to_hack/cleartarget /usr/local/bin/cleartarget
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	################### SET PERMISSIONS ###################
	echo -e "\n${purpleColour}[*] Configuring necessary permissions...\n${endColour}"
	sleep 2
	chmod +x ~/.local/bin/dotsup
	chmod -x ~/.local/bin/autoinstall.sh
	chmod -R +x ~/.config/bspwm
	chmod -R +x ~/.config/sxhkd
	chmod +x ~/.config/polybar/launch.sh
	chmod +x ~/.config/polybar/scripts/*
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	################### POST CONFIGURATION ###################
	echo -e "\n${purpleColour}[*] Removing repository...\n${endColour}"
	sleep 2
	rm -rfv $dir
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	echo -e "\n${purpleColour}[*] Cleaning...\n${endColour}"
	sleep 2
	sudo apt purge --autoremove -y
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	echo -e "\n${greenColour}[+] Full installed. You became a h4ck3r.\n${endColour}"
	sleep 1.5

	while true; do
		echo -en "\n${yellowColour}[?] It's necessary to restart the system. Do you want to restart the system now? ([y]/n) ${endColour}"
		read -r
		REPLY=${REPLY:-"y"}
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo -e "\n\n${greenColour}[+] Restarting the system...\n${endColor}"
			sleep 1
			sudo reboot
		elif [[ $REPLY =~ ^[Nn]$ ]]; then
			exit 0
		else
			echo -e "\n${redColour}[!] Invalid response, please try again\n${endColour}"
		fi
	done
fi


