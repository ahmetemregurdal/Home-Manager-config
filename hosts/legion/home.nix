{lib, pkgs, config, ...}:

{
	config = {
		userSettings = {
			browser = "qutebrowser";
			terminal = "foot";
			editor = "nixvim";
			git.enable = true;
			xdg.enable = true;
			languages = {
				cpp.enable = true;
			};
			nixcord.enable = true;
			signal.enable = true;
			shell.useful.enable = true;
			shell.useless.enable = true;
		};
	};
}
