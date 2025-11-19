{lib, pkgs, config, ...}:

{
	config = {
		userSettings = {
			browser = "qutebrowser";
			terminal = "foot";
			git.enable = true;
			xdg.enable = true;
		};
	};
}
