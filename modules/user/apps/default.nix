{config, pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		kdePackages.elisa
	];
}
