{config, lib, pkgs, osConfig, ...}:

let
	cfg = config.userSettings.gaming;
	switchKeys = pkgs.fetchzip {
		url = "https://files.prodkeys.net/Prodkeys.NET_v21-0-0.zip";
		name = "switchKeys";
		sha256 = "sha256-AExcHZjTU925k3If3l8saGXbTfAE8GAU/kvZeBboFhA=";
		stripRoot = false;
	};
	switchFirm = pkgs.fetchurl {
		url = "https://github.com/THZoria/NX_Firmware/releases/download/21.0.0/Firmware.21.0.0.zip";
		name = "switchFirm";
		sha256 = "sha256-HFUtOMtXrO6Xaf3MZwee8VB3lZOolRz4WSl48d9zlKE=";
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
						prod_keys = "${switchKeys}/prod.keys";
						title_keys = "${switchKeys}/title.keys";
					};
				};
			};
		};

		home.file.".config/Ryujinx/system/prod.keys" = {
			source = "${switchKeys}/prod.keys";
			enable = true;
		};

		home.file.".config/Ryujinx/system/title.keys" = {
			source = "${switchKeys}/title.keys";
			enable = true;
		};

# TODO: Make installation of firmware automated
		home.file.".config/Ryujinx/FIRMWARE.zip" = {
			source = switchFirm;
			enable = true;
		};
	};
}
