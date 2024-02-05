{ pkgs, config, home-manager, ... }:
{
	programs.wpaperd = {
		enable = true;
		settings = { default = { path = "Pictures/wallpaper.jpg"; }; };
	};
	home.file."Pictures/wallpaper.jpg" = {
		enable = true;
		source = ./wallpaper.jpg;
		target = "Pictures/wallpaper.jpg";
	};
}
