{lib, pkgs, config, ...}:

{
	config = {
		userSettings = {
			browser = "qutebrowser";
			terminal = "kitty";
			editor = "nixvim";
			git.enable = true;
			xdg.enable = true;
			languages = {
				cpp.enable = true;
			};
			nixcord.enable = true;
		};
	};
}
