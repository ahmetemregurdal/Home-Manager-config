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
		programs.qutebrowser = {
			enable = true;
		};
	};
}
