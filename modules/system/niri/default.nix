{config, pkgs, lib, inputs, ...}:
let
	cfg = config.systemSettings.niri;
in
{
	options = {
		systemSettings.niri.enable = lib.mkEnableOption "Enable Niri Wayland Compositor";
	};

	imports = [ inputs.niri.nixosModules.niri ];

	config = lib.mkIf cfg.enable {
		systemSettings.stylix.enable = true;
		programs.niri = {
			enable = true;
			package = pkgs.niri-stable;
		};

		services.upower.enable = true;
	};
}
