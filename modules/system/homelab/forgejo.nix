{config, lib, pkgs, ...}:

let
	cfg = config.selfhosting.forgejo;
in
{
	options = {
		selfhosting.forgejo = {
			enable = lib.mkEnableOption "Enable Forgejo";
		};
	};

	config = lib.mkIf cfg.enable {
		services.forgejo = {
			enable = true;
			lfs.enable = true;
		};
	};
}
