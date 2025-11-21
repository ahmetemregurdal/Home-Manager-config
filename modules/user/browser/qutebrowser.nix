{config, lib, pkgs, ...}:

let
	cfg = config.userSettings.qutebrowser;
in
{
	options = {
		userSettings.qutebrowser = {
			enable = lib.mkEnableOption "Enable qutebrowser";
		};
	};

	config = lib.mkIf cfg.enable {
		userSettings.stylix.enable = true;
		stylix.targets.qutebrowser.enable = true;
		programs.qutebrowser = {
			enable = true;
			settings = {
				changelog_after_upgrade = "patch";
				colors.webpage.preferred_color_scheme = stylix.polarity;
			};
		};
	};
}
