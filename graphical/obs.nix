{pkgs, home-manager, config, ...} :
{
	programs.obs-studio = {
		enable = true;
		plugins = with pkgs.obs-studio-plugins; [
			wlrobs
			obs-vkcapture
			obs-tuna
			obs-backgroundremoval
			obs-pipewire-audio-capture
		];
	};
}
