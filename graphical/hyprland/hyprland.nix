{ pkgs, home-manager, config, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		extraConfig = builtins.readFile ./hyprland.conf;
	};
	home.packages = with pkgs; [
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
		hyprshot
		hyprnome
		hyprkeys
		hyprdim
		hyprshade
		polkit_gnome
		udiskie
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
