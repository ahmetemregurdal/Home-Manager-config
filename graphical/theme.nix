{ pkgs, home-manager, config, ... }:
{
	/*stylix = {
		image = ./wpaperd/wallpaper.png;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		fonts = {
			monospace = {
				package = pkgs.fira-code;	
				name = "Fira Code";
			};
			emoji = {
				package = pkgs.noto-fonts-emoji;
				name = "Noto Color Emoji";
			};
			sansSerif = {
				package = pkgs.fira;
				name = "Fira Sans";
			};
			serif = config.stylix.fonts.sansSerif;
		};
		cursor = {
			package = pkgs.capitaine-cursors-themed;
			name = "Capitaine Cursors (Gruvbox)";
			size = 24;
		};
		targets = {
			kitty.variant256Colors = true;
			hyprland.enable = false;
		};
	};*/
	gtk = {
		enable = true;
		theme = {
			package = pkgs.gruvbox-dark-gtk;
			name = "gruvbox-dark";
		};
		iconTheme = {
			package = pkgs.gruvbox-dark-icons-gtk;
			name = "oomox-gruvbox-dark";
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
		platformTheme = "gtk";
	};
	home.pointerCursor = {
		package = pkgs.capitaine-cursors-themed;
		name = "Capitaine Cursors (Gruvbox)";
		size = 24;
	};
}
