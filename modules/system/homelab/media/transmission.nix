{config, lib, pkgs, ...}:

let
	cfg = config.selfhosting.media;
in
{
	config = lib.mkIf cfg.enable {
		services.transmission = {
			enable = true;
			webHome = pkgs.flood-for-transmission;
			openPeerPorts = true;
			settings.rpc-port = 9091;
		};
		services.nginx.virtualHosts."localhost".locations."/transmission/" = {
			proxyPass = "http://127.0.0.1:9091";
			extraConfig = ''
				rewrite ^/transmission/(.*)$ /$1 break;
				proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				proxy_set_header X-Transmission-Session-Id $http_x_transmission_session_id;
				proxy_redirect / /transmission/;
				proxy_redirect /web/ /transmission/web/;
			'';
		};
	};
}
