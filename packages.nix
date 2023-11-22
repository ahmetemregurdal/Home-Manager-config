{pkgs, config, home-manager, ...}:
{
	home.packages = with pkgs; [
		brightnessctl
		gcc
		jq
		neofetch
		nix-prefetch
		protonvpn-gui
		python311Packages.adblock
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
	];
}
