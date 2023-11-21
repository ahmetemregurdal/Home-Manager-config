{ pkgs, home-manager, config, ... }:
{
	programs.bash = {
		enable = true;
		bashrcExtra = builtins.readFile ./bashrc;
	};
}
