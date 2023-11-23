{pkgs, config, home-manager, ...}:
{
	services.mako = {
		enable = true;
		defaultTimeout = 5 * 1000;
		font = "Fira Code 12";
	};
	home.packages = with pkgs; [
		libnotify
	];
}
