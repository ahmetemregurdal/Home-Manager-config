{ pkgs, home-manager, config, ... }:
{
	programs.thunderbird = {
		enable = true;
		profiles.aeg = { isDefault = true; };
	};
}
