{pkgs, lib, config, ...}:

let
	cfg = config.systemSettings.displaymanager;
in
{
	options = {
		systemSettings.displaymanager.enable = lib.mkEnableOption "Enable DisplayManager";
	};

	config = lib.mkIf cfg.enable {
		systemSettings.stylix.enable = true;
		services.greetd.enable = true;
		services.greetd.settings.default_session = {
			command = "${pkgs.cage}/bin/cage -s -mlast -- ${pkgs.regreet}/bin/regreet";
			user = "greeter";
		};
		programs.regreet.enable = true;
		stylix.targets.regreet.enable = true;
		stylix.targets.gtk.enable = true;
	};
}
