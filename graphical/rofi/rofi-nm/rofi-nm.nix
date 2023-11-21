{config, pkgs, home-manager, ...}:
{
	home.packages = [
		(pkgs.writeScriptBin "rofi-nm" (builtins.readFile ./rofi-nm.sh))
	];
}
