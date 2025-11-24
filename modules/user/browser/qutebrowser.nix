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
			settings = {
				changelog_after_upgrade = "patch";
				colors.webpage.preferred_color_scheme = config.stylix.polarity;
				colors.webpage.darkmode.enabled = (config.stylix.polarity == "dark");

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
