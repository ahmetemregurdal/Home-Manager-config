{ pkgs, home-manager, config, ... }: 
{
	imports = [
		./zsh.nix
		./starship.nix
		./bash/bash.nix
		./lsd.nix
		./git.nix
		./gh.nix
		./command-not-found.nix
	];
}
