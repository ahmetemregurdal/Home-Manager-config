{pkgs, config, lib, ...}:

let
	cfg = config.userSettings.quickshell;
in

{
	options = {
		userSettings.quickshell.enable = lib.mkEnableOption "Enable Quickshell";
	};

	config = lib.mkIf cfg.enable {
		programs.quickshell = {
			enable = true;
			systemd.enable = true;
		};
	};
}
