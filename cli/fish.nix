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
		};
	};
}
