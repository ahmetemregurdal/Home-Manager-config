{config, ...}:

{
	imports = [
		./configuration.nix
		./hardware-configuration.nix
	];

	config = {
		home-manager.users = builtins.listToAttrs
		(map (user: {name = user; value = {imports = [./home.nix ../../modules/user/default.nix ]; }; }) config.systemSettings.users);
	};
}

