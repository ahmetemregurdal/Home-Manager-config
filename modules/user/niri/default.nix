{config, lib, pkgs, osConfig, inputs, ...}:

let
	cfg = config.userSettings.niri;
	font = config.stylix.fonts.monospace.name;
	term = config.userSettings.spawnTerminal;
in
{
	options = {
		userSettings.niri = {
			enable = lib.mkOption {
				default = if (osConfig.systemSettings.niri.enable) then true else false;
				type = lib.types.bool;
				description = "Enable Niri HomeManager";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		userSettings.stylix.enable = true;
		home.sessionVariables = {
			XDG_CURRENT_DESKTOP = "Niri";
		};
		programs.niri = {
			settings = {
				binds = with config.lib.niri.actions; {
					"Mod+T".action = spawn term;
					"Mod+D".action = spawn "fuzzel";
					"XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
					"XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
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
			};
		};
		stylix.targets.niri.enable = true;
		stylix.targets.fuzzel.enable = true;
		programs.fuzzel = {
			enable = true;
			settings = {
				main = {
					font = lib.mkForce (font + ":size=20");
					show-actions = true;
					terminal = term;
				};
			};
		};
	};
}
