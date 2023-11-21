{pkgs, home-manager, config, ...}:
{
	programs.git = {
		enable = true;
		userEmail = "ahmetemregurdal2008@gmail.com";
		userName = "ahmetemregurdal";
		lfs.enable = true;
	};
}
