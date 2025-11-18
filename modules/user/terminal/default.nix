{pkgs, lib, config, ...}:

let
	terminal = config.userSettings.terminal;
in
{
	options = {
		userSettings.terminal = lib.mkOption {
			default = "kitty";
			description = "Default terminal";
			type = lib.types.enum [ "kitty" ];
		};
		userSettings.spawnTerminal = lib.mkOption {
			default = "${pkgs.kitty}/bin/kitty";
			description = "Terminal spawn command";
			type = lib.types.str;
		};
	};

	config = {
		userSettings.kitty.enable = lib.mkDefault (config.userSettings.terminal == "kitty");

		userSettings.spawnTerminal = lib.mkMerge [
			(lib.mkIf (terminal == "kitty") "${pkgs.kitty}/bin/kitty" )
		];
	};
}
