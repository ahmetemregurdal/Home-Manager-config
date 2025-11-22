{config, lib, pkgs, ...}:

{
	config = {
		systemSettings = {
			stylix.theme = "gruvbox-dark-medium";
			niri.enable = true;
			users = [ "aeg" ];
			adminUsers = [ "aeg" ];
			security.doas.enable = true;
			cachy.enable = true;
			bluetooth.enable = true;
			gaming.enable = true;
		};
		home-manager.users.aeg.userSettings = {
			name = "Ahmet Emre Gürdal";
			email = "gurdalahmetemre@disroot.org";
		};
		users.users.aeg.description = "Ahmet Emre Gürdal";
		users.users.aeg.shell = pkgs.zsh;
		programs.zsh.enable = true;
	};
}
