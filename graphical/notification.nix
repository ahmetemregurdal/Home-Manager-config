{pkgs, config, home-manager, ...}:
{
	services.mako = {
		enable = true;
		defaultTimeout = 5 * 1000;
		font = "Fira Code 12";
		backgroundColor = "#282828";
		borderColor = "#89b482";
		borderRadius = 10;
		borderSize = 2;
		textColor = "#d4be98";
		margin = "20";
	};
	home.packages = with pkgs; [
		libnotify
	];
}
