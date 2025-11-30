{config, lib, pkgs, osConfig, ...}:

let
	cfg = config.userSettings.gaming;
	switchProd = ./nintendo-switch-prod.keys;
	switchTitle = ./nintendo-switch-title.keys;
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
				ryujinx = {
					package = pkgs.ryubing;
					settings.runner = {
						prod_keys = lib.mkForce (builtins.toString switchProd);
						title_keys = lib.mkForce (builtins.toString switchTitle);
					};
				};
			};
		};

		home.file.".config/Ryujinx/system/prod.keys" = {
			source = switchProd;
			enable = true;
		};
		home.file.".config/Ryujinx/system/title.keys" = {
			source = switchTitle;
			enable = true;
		};
	};
}
