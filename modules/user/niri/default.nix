{config, lib, pkgs, osConfig, inputs, ...}:

let
	cfg = config.userSettings.niri;
	font = config.stylix.fonts.monospace.name;
	term = config.userSettings.terminal;
	spawnTerm = config.userSettings.spawnTerminal;
	spawnBrowser = config.userSettings.spawnBrowser;
	spawnEditor = config.userSettings.spawnEditor;
in
{
	options = {
		userSettings.niri = {
			enable = lib.mkOption {
				default = osConfig.systemSettings.niri.enable;
				type = lib.types.bool;
				description = "Enable Niri HomeManager";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		userSettings.stylix.enable = true;
		home.sessionVariables = {
			XDG_CURRENT_DESKTOP = "Niri";
			NIXOS_OZONE_WL = "1";
			ELECTRON_OZONE_PLATFORM_HINT = "auto";
			XDG_SESSION_TYPE = "wayland";
		};
		programs.niri = {
			settings = {
				binds = with config.lib.niri.actions; {
					"Mod+T".action = spawn term;
					"Mod+D".action = spawn "fuzzel";
					"Mod+B".action = spawn-sh spawnBrowser;
					"Mod+E".action = spawn-sh spawnEditor;
					"XF86AudioRaiseVolume".action = spawn-sh "exec swayosd-client --output-volume=raise";
					"XF86AudioLowerVolume".action = spawn-sh "exec swayosd-client --output-volume=lower";
					"XF86AudioMute".action = spawn-sh "exec swayosd-client --output-volume=mute-toggle";
					"XF86AudioMicMute".action = spawn-sh "exec swayosd-client --input-volume=mute-toggle";
					"XF86MonBrightnessUp".action = spawn-sh "exec swayosd-client --brightness=raise";
					"XF86MonBrightnessDown".action = spawn-sh "exec swayosd-client --brightness=lower";
					"Mod+Shift+E".action = quit { skip-confirmation = true;};
					"Mod+O".action = toggle-overview;
					"Mod+Shift+F".action = fullscreen-window;
					"Mod+F".action = maximize-column;
					"Mod+Q".action = close-window;
					"Mod+H".action = focus-column-left;
					"Mod+L".action = focus-column-right;
					"Mod+J".action = focus-workspace-down;
					"Mod+K".action = focus-workspace-up;
				};
				prefer-no-csd = true;
				spawn-at-startup = [
					{ argv = [ "xwayland-satellite" ]; }
				];
			};
		};
		stylix.targets.niri.enable = true;
		stylix.targets.fuzzel.enable = true;
		services.wpaperd.enable = true;
		stylix.targets.wpaperd.enable = true;
		programs.fuzzel = {
			enable = true;
			settings = {
				main = {
					font = lib.mkForce (font + ":size=20");
					show-actions = true;
					terminal = spawnTerm;
				};
			};
		};

		stylix.targets.waybar.enable = true;
		programs.waybar = {
			enable = true;
			settings = {
				mainBar = {
					layer = "top";
					position = "top";
					height = 30;
					modules-left = [ "niri/workspaces" ];
					modules-center = [ "clock" ];
					modules-right = [ "backlight" "wireplumber" ];

					clock = {
						timezone = "Europe/Istanbul";
						interval = 60;
						format = "{:%H:%M}";
						tooltip-format = "<tt><small>{calendar}</small></tt>";
						calendar = {
							mode = "year";
							mode-mon-col = 3;
							weeks-pos = "right";
							on-scroll = 1;
							format = {
								months = "<span color='#" + config.lib.stylix.colors.base06 + "'><b>{}</b></span>";
								days = "<span color='#" + config.lib.stylix.colors.base0E + "'><b>{}</b></span>";
								weeks = "<span color='#" + config.lib.stylix.colors.base0D + "'><b>W{}</b></span>";
								weekdays = "<span color='#" + config.lib.stylix.colors.base0A + "'><b>{}</b></span>";
								today = "<span color='#" + config.lib.stylix.colors.base08 + "'><b><u>{}</u></b></span>";
							};
						};
					};

					backlight = {
						format = "{icon} {percent}%";
						format-icons = [ "󰃜" "󰃛" "󰃚" "󰃞" "󰃝" "󰃟" "󰃠" ];
						tooltip = false;
					};

					wireplumber = {
						format = "{icon} {volume}%";
						format-muted = " ";
						tooltip = false;
						format-icons = [ "" "" "" ];
					};
				};
			};

			systemd.enable = true;
		};

		services.swayosd = {
			enable = true;
			topMargin = 0.9;
		};
		home.packages = with pkgs; [
			wl-clipboard
		];

		services.wl-clip-persist = {
			enable = true;
		};
	};
}
