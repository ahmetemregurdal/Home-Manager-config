{ pkgs, config, home-manager, ... }:
{
	programs.wpaperd = {
		enable = true;
		settings = { default = { path = "Pictures/wallpaper.png"; }; };
	};
	home.file."Pictures/wallpaper.png" = {
		enable = true;
		source = ./wallpaper.png;
		target = "Pictures/wallpaper.png";
	};
}
