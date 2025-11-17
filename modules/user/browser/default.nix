{config, lib, ...}:

let
	browser = config.userSettings.browser;
in
{
	options = {
		userSettings.browser = lib.mkOption {
			default = null;
			description = "Default browser";
			type = lib.types.enum [ "qutebrowser" null ];
		};
		userSettings.spawnBrowser = lib.mkOption {
			default = "";
			description = "Default browser spawn command";
			type = lib.types.str;
		};
	};

	config = {
		userSettings.qutebrowser.enable = lib.mkIf (browser == "qutebrowser") true;

		userSettings.spawnBrowser = lib.mkMerge [
			(lib.mkIf (browser == "qutebrowser") "qutebrowser")
			(lib.mkIf (browser == null) "")
		];
	};
}
