{ pkgs, home-manager, config, ... }:
{
	imports = [
		./nvim/nvim.nix
		./btop.nix
		./tmux.nix
		./vifm/vifm.nix
	];
}
