{lib, config, pkgs, ...}:

let
	cfg = config.selfhosting.media;
in
{
	config = lib.mkIf cfg.enable {
		services.navidrome = {
			enable = true;
			settings = {
				MusicFolder = "/home/aeg/Media/Music";
				Address = "127.0.0.1";
				BaseUrl = "/navidrome";
				Port = 4533;
			};
		};
		services.nginx.virtualHosts."localhost".locations."/navidrome" = {
			proxyPass = "http://127.0.0.1:4533";
			proxyWebsockets = true;
			recommendedProxySettings = true;
		};
		systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce false;
	};
}
