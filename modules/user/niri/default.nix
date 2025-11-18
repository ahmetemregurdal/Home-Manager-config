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
		programs.niri = {
			settings = {
				binds = {
					"Mod+T".action.spawn = term;
					"Mod+D".action.spawn = "fuzzel";
				};
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
