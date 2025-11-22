{config, pkgs, lib, inputs, ...}:

let
	cfg = config.userSettings.elisa;
in
{
	options = {
		userSettings.elisa = {
			enable = lib.mkEnableOption "enable Elisa";
		};
	};

	imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

	config = lib.mkIf cfg.enable {
		userSettings.xdg.enable = true;
		userSettings.stylix.enable = true;
		programs.elisa = {
			enable = true;
			appearance = {
				defaultFilesViewPath = config.xdg.userDirs.music;
				defaultView = "allArtists";
				showNowPlayingBackground = true;
				showProgressOnTaskBar = true;
			};
			indexer = {
				paths = [
					config.xdg.userDirs.music
				];
				ratingsStyle = "favourites";
				scanAtStartup = true;
			};
			player = {
				minimiseToSystemTray = false;
				playAtStartup = false;
			};
		};
	};
}
