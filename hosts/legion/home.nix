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
				nix.enable = true;
			};
			nixcord.enable = true;
			signal.enable = true;
			elisa.enable = true;
			shell = {
				useful.enable = true;
				useless.enable = true;
			};
		};
	};
}
