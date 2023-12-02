{pkgs, config, home-manager, nix-index-database, ...}:
{
	programs.nix-index = {
		enable = true;
	};
}
