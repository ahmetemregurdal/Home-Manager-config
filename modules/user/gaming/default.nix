{config, lib, pkgs, osConfig, ...}:

let
	cfg = config.userSettings.gaming;
	switchProd = pkgs.fetchurl {
		url = "https://raw.githubusercontent.com/yeoyck/switch-prodkeys/master/v16.0.0/prod.keys";
		sha256 = "sha256-DZgnJMbbj2RcljiKSDbzlkH/GyPZ9K4mvxs3H3kaY3Q=";
		name = "switchprod.keys";
	};
	switchTitle = pkgs.fetchurl {
		url = "https://raw.githubusercontent.com/yeoyck/switch-prodkeys/master/v16.0.0/title.keys";
		sha256 = "sha256-HdyYWRnARfEl0aAYQLIJOVnF59DbBzaY99sursnCeVY=";
		name = "switchtitle.keys";
	};
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
						prod_keys = switchProd;
						title_keys = switchTitle;
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
