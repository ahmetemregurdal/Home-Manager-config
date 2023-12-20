{pkgs, config, home-manager, ...}:
{
	programs.zathura = {
		enable = true;
		options = {
			default-bg = "#1d2021";
			default-fg = "#d4be98";
			font = "Fira Code 9";
			recolor-darkcolor = "#d4be98";
			recolor-lightcolor = "#1d2021";
			recolor = true;
			completion-group-bg = "#1d2021";
			completion-gruop-fg = "#d4be98";
			completion-bg = "#1d2021";
			completion-fg = "#d4be98";
			completion-highlight-bg = "#333e34";
			completion-highlight-fg = "#d4be98";
			notification-error-bg = "#442e2d";
			notification-error-fg = "#d4be98";
			notification-warning-bg = "#473c29";
			notification-warning-fg = "#d4be98";
			notification-bg = "#282828";
			notification-fg = "#d4be98";
			inputbar-bg = "#282828";
			inputbar-fg = "#ddc7a1";
			statusbar-bg = "#1d2021";
			statusbar-fg = "#d4be98";
			highlight-color = "#2e3b3b";
			highlight-active-color = "#0d3138";
			index-bg = "#1d2021";
			index-fg = "#d4be98";
			index-active-bg = "#282828";
			index-active-fg = "#ddc7a1";
		};
	};
}
