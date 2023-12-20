{ pkgs, home-manager, config, ... }:
{
	gtk = {
		enable = true;
		theme = {
			package = pkgs.gruvbox-dark-gtk;
			name = "gruvbox-dark";
		};
		iconTheme = {
			package = pkgs.papirus-icon-theme;
			name = "Papirus-Dark";
		};
		font = {
			name = "Fira Code";
			package = pkgs.fira-code;
			size = 12;
		};
		cursorTheme = {
			package = pkgs.capitaine-cursors-themed;
			name = "Capitaine Cursors (Gruvbox)";
			size = 24;
		};
	};
	qt = {
		enable = true;
		platformTheme = "gtk3";
	};
	home.pointerCursor = {
		package = pkgs.capitaine-cursors-themed;
		name = "Capitaine Cursors (Gruvbox)";
		size = 24;
	};
}
