{config, lib, pkgs, ...}:

let
	cfg = config.userSettings.languages;
in
{
	options = {
		userSettings.languages = {
			cpp.enable = lib.mkEnableOption "Enable c/c++";
		};
	};

	config = {
		home.packages = lib.flatten ([
			(lib.optionals cfg.cpp.enable [
				pkgs.gcc
			])
		]);
	};
}
