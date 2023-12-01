{ pkgs, home-manager, config, ... }:
{
	wayland.windowManager.hyprland = {
		xwayland.enable = true;
		extraConfig = builtins.readFile ./hyprland.conf;
	};
	home.packages = with pkgs; [
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
		(pkgs.writeScriptBin "hyprshot" (builtins.readFile ./hyprshot.sh))
		grim
		slurp
	];
}
