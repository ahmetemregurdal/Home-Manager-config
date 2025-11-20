{config, pkgs, lib, ...}:

let
	cfg = config.userSettings.signal;
in
{
	options = {
		userSettings.signal.enable = lib.mkEnableOption "Enable Signal";
	};

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [
			signal-desktop-bin
		];
	};
}
