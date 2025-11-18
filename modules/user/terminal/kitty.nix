{config, pkgs, lib, ...}:

let
	cfg = config.userSettings.niri;
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
			};
		};
	};
}
