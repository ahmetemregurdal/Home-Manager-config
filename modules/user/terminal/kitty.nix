{config, pkgs, lib, ...}:

let
	cfg = config.userSettings.kitty;
in
{
	options = {
		userSettings.kitty = {
			enable = lib.mkEnableOption "Enable Kitty";
		};
	};

	config = lib.mkIf cfg.enable {
		userSettings.stylix.enable = true;
		stylix.targets.kitty.enable = true;
		programs.kitty = {
			enable = true;
			settings = {
				configm_os_window_close = 0;
				enable_audio_bell = false;
			};
			keybindings = {
				"ctrl+equal" = "change_font_size all +2.0";
				"ctrl+minus" = "change_font_size all -2.0";
			};
		};
	};
}
