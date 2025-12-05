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
			settings = {
				server = {
					ROOT_URL = "http://localhost/forgejo/";
				};
			};
		};

		services.nginx.virtualHosts."localhost".locations."/forgejo/" = {
			extraConfig = ''
				rewrite ^ $request_uri;
				rewrite ^/forgejo(/.*) $1 break;
				return 400;
				proxy_pass http://127.0.0.1:3000$safe_uri;
				proxy_set_header Connection $http_connection;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
				client_max_body_size 512M;
			'';
		};
	};
}
