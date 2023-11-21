{config, pkgs, home-manager, ...}:
{
	home.packages = [
		(pkgs.discord.override {
			withVencord = true;
			withOpenASAR = true;
		 })
	];
	home.file.".config/discord/settings.json" = {
		enable = true;
		source = ./openasar.json;
		target = ".config/discord/settings.json";
	};
	home.file.".config/Vencord/settings/settings.json" = {
		enable = true;
		source = ./vencord.json;
		target = ".config/Vencord/settings/settings.json";
	};
	home.file.".config/Vencord/settings/quickCss.css" = {
		enable = true;
		source = ./vencord.css;
		target = ".config/Vencord/settings/quickCss.css";
	};
}
