{config, lib, pkgs, ...}:

let
	cfg = config.userSettings.qutebrowser;
	term = config.userSettings.terminal;
in
{
	options = {
		userSettings.qutebrowser = {
			enable = lib.mkEnableOption "Enable qutebrowser";
		};
	};

	config = lib.mkIf cfg.enable {
		userSettings.stylix.enable = true;
		userSettings.shell.useful.enable = true;
		stylix.targets.qutebrowser.enable = true;
		programs.qutebrowser = {
			enable = true;
			loadAutoconfig = true;
			greasemonkey = [
				(pkgs.fetchurl {
					url = "https://update.greasyfork.org/scripts/461288/Bullyforces.user.js";
					sha256 = "1ppp1babzai5ch19pz051gq1zqqhmcjpwsld0gidryxwpx03gdr2";
				})
				(pkgs.fetchurl {
					url = "https://raw.githubusercontent.com/torrq/rut-english/refs/heads/main/rutracker-in-english.user.js";
					sha256 = "sha256-5PmJxtMiWSdLaIXpwATZEL9mlZo1DrRpiQunhbxl6uE=";
				})
			];
			settings = {
				changelog_after_upgrade = "patch";
				colors.webpage = {
					preferred_color_scheme = config.stylix.polarity;
					darkmode.enabled = (config.stylix.polarity == "dark");
				};
				content = {
					blocking.method = "both";
					pdfjs = true;
				};
				scrolling.smooth = true;

				downloads.remove_finished = 2000;
				editor.command = config.userSettings.spawnEditorArgList ++ ["{}"];

				tabs = {
					position = "left";
					favicons.scale = 1.0;
					width = "4%";
					show = "multiple";
					title.format = "{index} {audio}";
				};

				window.hide_decoration = true;

				fileselect = {
					handler = "external";
					single_file.command = [ term "-e" "yazi" "--chooser-file={}" "{dir}" ];
					multiple_files.command = [ term "-e" "yazi" "--chooser-file={}" "{dir}" ];
					folder.command = [ term "-e" "yazi" "--chooser-file={}" "{dir}" ];
				};
			};
		};
	};
}
