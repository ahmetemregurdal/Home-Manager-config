{config, pkgs, lib, ...}:

let
	term = config.userSettings.terminal;
	editor = config.userSettings.editor;
in
{
	options = {
		userSettings.editor = lib.mkOption {
			default = "nixvim";
			description = "Default editor";
			type = lib.types.enum [ "nixvim" ];
		};

		userSettings.spawnEditor = lib.mkOption {
			default = "";
			description = "Command to spawn editor";
			type = lib.types.str;
		};
	};

	config = {
		userSettings.nixvim.enable = lib.mkDefault (editor == "nixvim");

		userSettings.spawnEditor = lib.mkMerge [
			(lib.mkIf (editor == "nixvim") ("exec" + term + " -e " + editor))
		];
	};
}
