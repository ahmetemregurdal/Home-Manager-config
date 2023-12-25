{pkgs, config, home-manager, ...}:
{
	services.mako = {
		enable = true;
		defaultTimeout = 5 * 1000;
		font = "Fira Code 12";
		backgroundColor = "#1d2021";
		borderColor = "#89b482";
		borderRadius = 10;
		borderSize = 2;
		textColor = "#d4be98";
	};
	home.packages = with pkgs; [
		libnotify
	];
}
