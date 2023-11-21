{pkgs, config, home-manager, ...}:
{
	xdg = {
		enable = true;
		cacheHome = "/home/aeg/.cache";
		configHome = "/home/aeg/.config";
		dataHome = "/home/aeg/.local/share";
		stateHome = "/home/aeg/.local/state";
		userDirs = {
			enable = true;
			createDirectories = true;
		};
	};
}
