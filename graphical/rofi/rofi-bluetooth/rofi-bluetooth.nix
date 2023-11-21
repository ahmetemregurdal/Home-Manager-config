{home-manager, pkgs, config, ...}:
{
	home.packages = [
		(pkgs.writeScriptBin "rofi-bluetooth" (builtins.readFile ./rofi-bluetooth.sh))
	];
}
