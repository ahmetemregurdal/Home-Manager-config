{home-manager, config, pkgs, ...}:
{
	xdg = {
		mime.enable = true;
		mimeApps = {
			enable = true;
			defaultApplications = {
				"terminal" = ["kitty.desktop"];
			};
		};
	};
}
