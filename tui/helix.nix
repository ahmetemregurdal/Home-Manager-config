{pkgs, home-manager, config, ...}:
{
	programs.helix = {
		enable = true;
		settings = {
			theme = "gruvbox_dark_hard";
		};
	};
}
