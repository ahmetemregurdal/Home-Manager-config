{config, lib, pkgs, ...}:

let
	cfg = config.userSettings.xdg;
in
{
	options = {
		userSettings.xdg = {
			enable = lib.mkEnableOption "Enable XDG dirs and MIME";
		};
	};

	config = lib.mkIf cfg.enable {
		xdg.enable = true;
		xdg.userDirs = {
			enable = true;
			createDirectories = true;
			music = "${config.home.homeDirectory}/Media/Music";
			videos = "${config.home.homeDirectory}/Media/Video";
			pictures = "${config.home.homeDirectory}/Media/Pictures";
			templates = "${config.home.homeDirectory}/Templates";
			download = "${config.home.homeDirectory}/Downloads";
			documents = "${config.home.homeDirectory}/Documents";
			desktop = null;
			publicShare = null;
		};
		xdg.mime.enable = true;
		xdg.mimeApps.enable = true;
	};
}
