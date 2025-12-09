{config, lib, pkgs, ...}:

let
	cfg = config.userSettings.beets;
in
{
	options = {
		userSettings.beets.enable = lib.mkEnableOption "Enable Beets";
	};

	config = lib.mkIf cfg.enable {
		programs.beets = {
			enable = true;
			settings = {
				directory = config.xdg.userDirs.music;
				library = "${config.home.homeDirectory}/.local/share/beets.dp";
				import = {
					move = true;
				};
				plugins = [
					"musicbrainz"
					"lyrics"
					"fetchart"
					"embedart"
					"fromfilename"
				];
				lyrics = {
					synced = true;
				};
			};
		};
	};
}
