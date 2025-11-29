{lib, pkgs, config, ...}:

let
	cfg = config.selfhosting.media;
in
{
	config = lib.mkIf cfg.enable {
		services.komga = {
			enable = true;
			settings = {
				server = {
					port = 25600;
					servlet = {
						context-path = "/komga";
					};
				};
			};
		};

		services.nginx.virtualHosts."localhost" = {
			locations."/komga" = {
				proxyPass = "http://127.0.0.1:25600/komga";
				extraConfig = ''
					proxy_set_header X-Forwarded-Host $host;
					proxy_set_header X-Forwarded-Proto $scheme;
					proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				'';
			};
		};
	};
}
