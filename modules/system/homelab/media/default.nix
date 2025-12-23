{config, lib, pkgs, ...}:

{
	options = {
		selfhosting.media.enable = lib.mkEnableOption "Enable Media Management";
	};
}
