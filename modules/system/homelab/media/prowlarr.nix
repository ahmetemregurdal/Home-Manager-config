{config, lib, pkgs, ...}:

let
	cfg = config.selfhosting.media;
in
{
	config = lib.mkIf cfg.enable {
		services.prowlarr = {
			enable = true;
			settings = {
				server = {
					urlbase = "/prowlarr";
					port = 9696;
				};
			};
		};
		services.nginx.virtualHosts."localhost".locations."/prowlarr" = {
			proxyPass = "http://127.0.0.1:9696";
			extraConfig = ''
				proxy_set_header X-Script-Name "/prowlarr";
			'';
		};
	};
}
