{ pkgs, home-manager, config, ... }:
{
	programs.kitty = {
		enable = true;
		font = {
			name = "Fira Code";
			package = pkgs.fira-code;
			size = 12;
		};
		settings = { enable_audio_bell = false; };
		theme = "Gruvbox Material Dark Hard";
	};
}
