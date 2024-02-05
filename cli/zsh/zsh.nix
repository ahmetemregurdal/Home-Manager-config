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
			llta = "lsd -lA --tree";
			vf = "vifmrun";
			lta = "lsd -A --tree";
			tmux = "TERM=xterm-256color tmux";
			"\"\\$\"" = " ";
			"\"#\"" = "sudo ";
			cptemp = "rm \${HOME}/.cache/cptemp.cpp; cp \${HOME}/Documents/olimpiyat/templates/template.cpp \${HOME}/.cache/cptemp.cpp && chmod u+w \${HOME}/.cache/cptemp.cpp && cp \${HOME}/.cache/cptemp.cpp";
			cpwhilet = "rm \${HOME}/.cache/cpwhilet.cpp; cp \${HOME}/Documents/olimpiyat/templates/whilet.cpp \${HOME}/.cache/cpwhilet.cpp && chmod u+w \${HOME}/.cache/cpwhilet.cpp && cp \${HOME}/.cache/cpwhilet.cpp";
			d = "kitten diff";
		};
		syntaxHighlighting.enable = true;
		initExtra = builtins.readFile ./zshrc;
	};
}
