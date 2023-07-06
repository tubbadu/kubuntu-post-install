
#remove ubuntu telemetry
wget https://gist.githubusercontent.com/CodeSigils/974abb61becf435c857b55e925f12780/raw/c1608eb508e7f2f6d2b6e7035c0fc3828db70023/ubuntu-remove-telemetry.sh
sudo bash ubuntu-remove-telemetry.sh

#enable multiverse repo
sudo add-apt-repository multiverse -y

# install flatpak
sudo add-apt-repository ppa:alexlarsson/flatpak -y
sudo apt update
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# remove snaps of firefox and chromium, if present
sudo snap remove firefox
sudo snap remove chromium

# install flatpak apps
flatpak install org.onlyoffice.desktopeditors -y
flatpak install com.spotify.Client -y
flatpak install org.chromium.Chromium -y
flatpak install org.mozilla.firefox -y

# install wine
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt install --install-recommends winehq-stable -y

# install apps
sudo apt install steam -y
sudo apt install lutris -y
sudo apt install kpat -y
sudo apt install telegram-desktop -y
sudo apt install minetest -y
sudo apt install haruna -y
sudo apt install timeshift -y

# install wayland
sudo apt install plasma-workspace-wayland -y
echo -e "\n\nexport MOZ_ENABLE_WAYLAND=1" >> ~/.bashrc
