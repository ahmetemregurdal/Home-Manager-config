{config, pkgs, home-manager, ...}:
{
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;
		plugins = with pkgs; [
			rofi-emoji
				rofi-top
				rofi-calc
				rofi-file-browser

		];
		theme = "gruvbox-dark-hard";
		terminal = "\${pkgs.kitty}/bin/kitty";
	};
	home.packages = with pkgs; [
		rofi-pulse-select
	];
	imports = [
		./rofi-nm/rofi-nm.nix
		./rofi-bluetooth/rofi-bluetooth.nix
	];
	home.file.".config/rofi/rasis" = {
		enable = true;
		source = ./rasis;
		recursive = true;
		target = ".config/rofi/rasis";
	};
}
