{pkgs, home-manager, config, ...} :
{
	programs.fish = {
		enable = true;
		shellAliases = {
			c = "clear";
			l = "lsd";
			llta = "lsd -lA --tree";
			lta = "lsd -A --tree";
			v = "nvim";
			hx = "helix";
			vf = "vifmrun";
			tmux = "TERM=xterm-256color tmux";
			"\"\\$\"" = " ";
			"\"#\"" = "sudo ";
			cptemp = "rm \${HOME}/.cache/cptemp.cpp && cp \${HOME}/Documents/olimpiyat/templates/template.cpp \${HOME}/.cache/cptemp.cpp && chmod u+w \${HOME}/.cache/cptemp.cpp && cp \${HOME}/.cache/cptemp.cpp";
			cpwhilet = "rm \${HOME}/.cache/cpwhilet.cpp && cp \${HOME}/Documents/olimpiyat/templates/whilet.cpp \${HOME}/.cache/cpwhilet.cpp && chmod u+w \${HOME}/.cache/cpwhilet.cpp && cp \${HOME}/.cache/cpwhilet.cpp";
			d = "kitten diff";
		};
	};
}
