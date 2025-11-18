{lib, pkgs, config, ...}:

{
	config = {
		userSettings = {
			name = "Ahmet Emre Gürdal";
			email = "gurdalahmetemre@disroot.org";
			browser = "qutebrowser";
			terminal = "kitty";
			git.enable = true;
			xdg.enable = true;
		};
	};
}
