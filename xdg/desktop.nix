{config, pkgs, home-manager}:
{
	xdg.desktopEntries = {
		"neovim" = {
			comment = "Powerful Editting tool with Mods";
			genericName = "neovim";
			name = "NeoVim";
			terminal = true;
			type = "Application";
		};
	};
}
