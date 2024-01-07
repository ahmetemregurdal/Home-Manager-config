{ pkgs, home-manager, config, ... }:
{
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				margin-bottom = 0;
				margin-top = 5;
				margin-right = 5;
				margin-left = 5;
				modules-left = [
					"custom/launcher"
					"cpu"
					"memory"
					"gamemode"
					"bluetooth"
					"tray"
				];
				modules-center = [ "hyprland/workspaces" ];
				modules-right =
					[ "backlight" "pulseaudio" "clock" "custom/weather" "battery" ];
				pulseaudio = {
					tooltip = false;
					reverse-scrolling = true;
					scroll-step = 5;
					format = "{icon} {volume}%";
					format-muted = "󰝟 0%";
					on-click = "pamixer -t";
					format-icons = {
						headphone = "";
						hands-free = "󰋏";
						headset = "󰋎";
						phone = "";
						portable = "";
						car = "";
						default = [ "" "" "" ];
					};
				};
				backlight = {
					tooltip = false;
					format = " {}%";
					interval = 1;
					on-scroll-up = "brightnessctl set 5%-";
					on-scroll-down = "brightnessctl set 5%+";
				};
				battery = {
					states = {
						good = 95;
						warning = 30;
						critical = 20;
					};
					format = "{icon}  {capacity}%";
					format-charging = " {capacity}%";
					format-plugged = " {capacity}%";
					format-alt = "{time} {icon} ";
					format-icons = [ "" "" "" "" "" ];
				};
				tray = {
					icon-size = 18;
					spacing = 10;
					show-passive-items = true;
				};
				clock = { format = "{: %I:%M %p  󰸗 %d/%m/%Y}"; };
				cpu = {
					interval = 15;
					format = " {}%";
					max-length = 10;
				};
				memory = {
					interval = 30;
					format = " {}%";
					max-length = 10;
				};
				"custom/launcher" = {
					format = " ";
					on-click = "rofi -show drun -theme .config/rofi/rasis/launcher.rasi";
					on-click-right = "killall rofi";
				};
				"hyprland/workspaces" = {
					format = "{name}";
					on-scroll-up = "hyprctl dispatch workspace e+1";
					on-scroll-down = "hyprctl dispatch workspace e-1";
					on-click = "activate";
				};
				"custom/weather" = {
					format = "{}°";
					tooltip = true;
					interval = 3600;
					exec = "wttrbar --location Istanbul";
					return-type = "json";
				};
				bluetooth = {
					tooltip-format-connected-battery = "󰥈 {device-battery-percentage}";
					on-click = "rofi-bluetooth";
					format-connected-battery = "󰥈 {device_alias}";
					format-connected = "󰂯 {device_alias}";
					format-on = "󰂯";
					format-off = "󰂲";
				};
				gamemode = {
					use-icon = false;
					glyph = "";
				};
			};
		};
		style = builtins.readFile ./waybar.css;
	};
	home.packages = with pkgs; [
		wttrbar
		pamixer
		networkmanagerapplet
	];
}
