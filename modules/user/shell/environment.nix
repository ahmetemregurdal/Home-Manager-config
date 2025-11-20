{pkgs, config, lib, ...}:

{
	home.sessionVariables = {
		NIXOS_OZONE_WL = "1";
		ELECTRON_OZONE_PLATFORM_HINT = "auto";
		XDG_SESSION_TYPE = "wayland";	
	};
}
