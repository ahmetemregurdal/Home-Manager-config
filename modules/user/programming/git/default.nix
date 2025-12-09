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
			settings = {
				user = {
					name = config.userSettings.name;
					email = config.userSettings.email;
				};
			};
			lfs.enable = true;
		};
	};
}
