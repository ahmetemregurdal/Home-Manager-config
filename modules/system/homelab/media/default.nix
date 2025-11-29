{config, lib, pkgs, ...}:

let
	cfg = config.selfhosting.media;
in
{
	options = {
		selfhosting.media.enable = lib.mkEnableOption "Enable Media Management";
	};
}
