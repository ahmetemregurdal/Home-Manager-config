{config, pkgs, home-manager, ...}: {
	programs.lsd = {
		enable = true;
		enableAliases = true;
	};
}
