{config, lib, pkgs, ...}:

let
	cfg = config.userSettings.engineering;
in
{
	options = {
		userSettings.engineering = {
			enable = lib.mkEnableOption "Enable engineering";
		};
	};

	config = lib.mkIf cfg.enable {
		home.packages = [
			pkgs.kicad
			pkgs.freecad
			pkgs.openscad
		];
	};
}
