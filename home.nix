{ pkgs, home-manager, config, nur, ... }:
{
	home.stateVersion = "24.05";
	home.homeDirectory = "/home/aeg";
	home.username = "aeg";
	imports =[ 
		./tui/main.nix
		./cli/main.nix
		./graphical/main.nix
		./packages.nix
		./envvars.nix
		./files/main.nix
	];
	programs.home-manager.enable = true;
}
