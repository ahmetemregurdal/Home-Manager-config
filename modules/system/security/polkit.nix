{pkgs, lib, config, ...}:

let
	cfg = config.systemSettings.security.polkit;
in
{
	options = {
		systemSettings.security = {
			polkit.enable = lib.mkEnableOption "Enable Polkit";
		};
	};

	config = lib.mkIf cfg.enable {
		security.polkit = {
			enable = true;
		};
	};
}
