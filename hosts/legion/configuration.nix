{config, lib, pkgs, ...}:

{
	config = {
		systemSettings = {
			stylix.theme = "gruvbox-dark";
			stylix.enable = true;
			niri.enable = true;
			users = [ "aeg" ];
			adminUsers = [ "aeg" ];
			security.doas.enable = true;
			security.mullvad.enable = true;
			cachy.enable = false;
			bluetooth.enable = true;
			displaymanager.enable = true;
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
