{pkgs, config, home-manager, ...}:
{
	home.packages = with pkgs; [
		brightnessctl
		gcc
		jq
		neofetch
		nix-prefetch
		protonvpn-gui
		speedtest-cli
		tldr
		unzip
		gamemode
		libsForQt5.qtstyleplugins
		python3Full
		inetutils
		_7zz
		qbittorrent
		whatsapp-for-linux
		libreoffice-fresh
		bitwarden
		bitwarden-cli
		age
		lynx
		virt-manager
		timelimit
	];
}
