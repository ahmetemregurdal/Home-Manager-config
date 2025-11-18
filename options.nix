{config, lib, pkgs, ...}: 

{

	config = {
		systemSettings = {
			stylix.theme = "gruvbox-dark-medium";
			niri.enable = true;
		};
	};
}
