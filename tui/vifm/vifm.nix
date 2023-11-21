{pkgs, home-manager, config, ...}:
{
	home.packages = with pkgs; [
		vifm-full
		ueberzugpp
		ffmpegthumbnailer
		imagemagick
		poppler_utils
		djvulibre
		gnome-epub-thumbnailer
		fontpreview
		(pkgs.writeScriptBin "vifmrun" (builtins.readFile ./vifmrun.sh))
		(pkgs.writeScriptBin "vifmimg" (builtins.readFile ./vifmimg.sh))
		highlight
		mdcat
	];
	home.file.".config/vifm/vifmrc" = {
		enable = true;
		source = ./vifmrc;
		target = ".config/vifm/vifmrc";
	};
	home.file.".config/vifm/scripts" = {
		enable = true;
		source = ./scripts;
		recursive = true;
		target = ".config/vifm/scripts";
	};
}
