{ pkgs, home-manager, config, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		enableNvidiaPatches = true;
		extraConfig = builtins.readFile ./hyprland.conf;
	};
	home.packages = with pkgs; [
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
		(pkgs.writeScriptBin "hyprshot" (builtins.readFile ./hyprshot.sh))
		grim
		slurp
		hyprnome
		hyprkeys
		hyprdim
		hyprshade
		polkit_gnome
	];
	home.file.".config/hypr/hyprshade.toml" = {
		enable = true;
		source = ./hyprshade.toml;
		target = ".config/hypr/hyprshade.toml";
	};
	home.file.".config/hypr/shaders/blue-light-filter.glsl" = {
		enable = true;
		source = ./blue-light-filter.glsl;
		target = ".config/hypr/shaders/blue-light-filter.glsl";
	};
}
