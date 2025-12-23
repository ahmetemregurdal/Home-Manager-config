{config, lib, pkgs, ...}:

let
	cfg = config.selfhosting.llm;
in
{
	config = lib.mkIf cfg.enable {
		services.sillytavern = {
			enable = true;
			port = 8045;
		};
	};
}
