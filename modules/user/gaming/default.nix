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

	config = lib.mkIf cfg.enable {
		programs.lutris = {
			enable = true;
			defaultWinePackage = pkgs.proton-ge-bin;
			steamPackage = osConfig.programs.steam.package;
			winePackages = [ pkgs.proton-ge-bin ];
			protonPackages = [ pkgs.proton-ge-bin ];
			runners = {
			};
		};
	};
}
