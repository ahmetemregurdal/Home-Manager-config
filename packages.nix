{pkgs, config, home-manager, ...}:
{
	home.packages = with pkgs; [
		brightnessctl
		gcc
		jq
		neofetch
		nix-prefetch
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
		comma
		cliphist
		obs-studio
		obs-cli
		kotlin
		openjdk17-bootstrap
		gnumake
	];
	nixpkgs.config.permittedInsecurePackages = [
		"openssl-1.1.1w"
	];
}
