{config, pkgs, lib, ...}:

let
	cfg = config.userSettings.zed;
in
{
	options = {
		userSettings.zed.enable = lib.mkEnableOption "Enable Zed";
	};

	config = lib.mkIf cfg.enable {
		stylix.targets.zed.enable = true;
		programs.zed-editor = {
			enable = true;
			userSettings = {
				telemetry = {
					metrics = false;
					diagnostics = false;
				};
				vim_mode = true;
			};
		};
	};
}
