{config, pkgs, ...}:

{
	home.stateVersion = "25.11";
	imports = [
		./modules/user/default.nix
		./home-options.nix
	];
}
