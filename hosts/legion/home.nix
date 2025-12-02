{lib, pkgs, config, ...}:

{
	config = {
		userSettings = {
			browser = "qutebrowser";
			terminal = "foot";
			editor = "nixvim";
			stylix.enable = true;
			nixvim.enable = true;
			emacs.enable = true;
			kitty.enable = true;
			helix.enable = true;
			pgp.enable = true;
			rbw = {
				enable = true;
				mail = "ahmetemregurdal2008@gmail.com";
			};
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
