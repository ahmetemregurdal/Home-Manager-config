{ pkgs, home-manager, config, ... }:
{
	programs.zsh = {
		enable = true;
		enableAutosuggestions = true;
		enableCompletion = true;
		autocd = true;
		defaultKeymap = "viins";
		enableVteIntegration = true;
		history = {
			ignoreAllDups = true;
			extended = true;
			expireDuplicatesFirst = true;
		};
		shellAliases = {
			c = "clear";
			v = "nvim";
			l = "lsd";
			vf = "vifmrun";
			tmux = "TERM=xterm-256color tmux";
		};
		syntaxHighlighting.enable = true;
		initExtra = builtins.readFile ./zshrc;
	};
}
