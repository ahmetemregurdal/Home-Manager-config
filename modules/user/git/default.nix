{config, lib, pkgs, ...}:

let
	cfg = config.userSettings.git;
in
{
	options = {
		userSettings.git.enable = lib.mkEnableOption "Enable git";
	};

	config = lib.mkIf cfg.enable {
		programs.git = {
			enable = true;
			userName = config.userSettings.name;
			userEmail = config.userSettings.email;
			lfs.enable = true;
		};
	};
}
