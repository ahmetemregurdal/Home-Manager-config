{pkgs, config, home-manager, ...}: {
	home.sessionVariables = {
		XCURSOR_SIZE = 16;
		XDG_SESSION_TYPE = "wayland";
		XDG_CURRENT_DESKTOP = "Hyprland";
		XDK_SESSION_DESKTOP = "Hyprland";
		QT_AUTO_SCREEN_SCALE_FACTOR = 1;
		QT_QPA_PLATFORM = "wayland;xsb";
		LIBVA_DRIVER_NAME = "nvidia";
		MOZ_ENABLE_WAYLAND = 1;
		GAMEMODERUNEXEC = "nvidia-offload";
	};
}
