{ pkgs, config, home-manager, ... }:
{
	programs.tmux = {
		enable = true;
		disableConfirmationPrompt = true;
		escapeTime = 0;
		mouse = true;
		keyMode = "vi";
		newSession = true;
	};
}
