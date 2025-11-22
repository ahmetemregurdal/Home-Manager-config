{lib, pkgs, config, ...}:

{
	config = {
		userSettings = {
			browser = "qutebrowser";
			terminal = "foot";
			editor = "nixvim";
			stylix.enable = true;
			nixvim.enable = true;
			helix.enable = true;
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
