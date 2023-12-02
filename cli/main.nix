{ pkgs, home-manager, config, ... }: 
{
	imports = [
		./zsh/zsh.nix
		./starship.nix
		./bash/bash.nix
		./lsd.nix
		./git.nix
		./gh.nix
	];
}
