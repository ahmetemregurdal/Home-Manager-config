{pkgs, config, home-manager, ...}:
{
	programs.gh = {
		enable = true;
		gh-dash = {
			enable = true;
		};
	};
}
