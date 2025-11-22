{config, lib, pkgs, inputs, ...}:

let
	cfg = config.userSettings.languages;
in
{
	options = {
		userSettings.languages = {
			cpp.enable = lib.mkEnableOption "Enable c/c++";
			nix.enable = lib.mkEnableOption "Enable fancy nix";
		};
	};

	config = {
		home.packages = lib.flatten ([
			(lib.optionals cfg.cpp.enable [
				pkgs.gcc
			])

			(lib.optionals cfg.nix.enable [
				inputs.alejandra.defaultPackage.${pkgs.stdenv.hostPlatform.system}
			])
		]);

		home.file."${config.home.homeDirectory}/.config/alejandra.toml" = {
			enable = cfg.nix.enable;
			text = ''
				indentation = "Tabs"
			'';
		};
	};
}
