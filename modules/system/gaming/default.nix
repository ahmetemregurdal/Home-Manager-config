{lib, config, pkgs, ...}:

let
	cfg = config.systemSettings.gaming;
in
{
	options = {
		systemSettings.gaming = {
			enable = lib.mkEnableOption "Enable gaming packages";
		};
	};

	config = lib.mkIf cfg.enable {
		programs.gamemode = {
			enable = true;
			enableRenice = true;
		};
		programs.gamescope = {
			enable = true;
			capSysNice = true;
		};
		programs.steam = {
			enable = true;
			extraCompatPackages = with pkgs; [
				proton-ge-bin
			];
		};

		users.groups = {
			steam = {
				members = config.systemSettings.users;
			};
		};
	};
}
