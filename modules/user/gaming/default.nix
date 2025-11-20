{config, lib, pkgs, osConfig, ...}:

let
	cfg = config.userSettings.gaming;
in
{
	options = {
		userSettings.gaming.enable = lib.mkOption {
			default = osConfig.systemSettings.gaming.enable;
			description = "Enable Home-Manager gaming settings";
			type = lib.types.bool;
		};
	};

	config = {
		programs.lutris = {
			enable = true;
		};
	};
}
