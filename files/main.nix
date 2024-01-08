{home-manager, config, pkgs, ...} :
{
	home.file = {
		"Documents/olimmpiyat/templates" = {
			enable = true;
			recursive = true;
			source = ./cp-templates;
			target = "Documents/olimpiyat/templates";
		};
	};
}
