{ pkgs, home-manager, config, ... }:
{
	programs.btop = {
		enable = true;
		settings = { color_theme = "gruvbox_dark"; };
	};
}
