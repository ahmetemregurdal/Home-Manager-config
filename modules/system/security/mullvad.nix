{config, pkgs, lib, ...}:

let
	cfg = config.systemSettings.security.mullvad;
in
{
	options = {
		systemSettings.security.mullvad.enable = lib.mkEnableOption "Enable mullvadvpn";
	};

	config = lib.mkIf cfg.enable {
		services.mullvad-vpn = {
			enable = true;
			package = pkgs.mullvad-vpn;
		};
	};
}
