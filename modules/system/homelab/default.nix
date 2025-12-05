{pkgs, lib, config, ...}:

let
	cfg = config.selfhosting;
in

{
	options = {
		selfhosting.enable = lib.mkEnableOption "enable selfhosting";
	};

	config = lib.mkIf cfg.enable {
		services.nginx = {
			enable = true;
			statusPage = true;
			virtualHosts."localhost" = {
				listen = [ { addr = "127.0.0.1"; port = 80; } ];
			};
			appendHttpConfig = ''
				map $uri $safe_uri {
					"~*[\n\r]" "";
					default $uri;
				}
			'';
		};
		services.tailscale = {
			enable = true;
			openFirewall = true;
		};
	};
}
