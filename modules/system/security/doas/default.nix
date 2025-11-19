{config, pkgs, lib, ...}:

let
	cfg = config.systemSettings.security.doas;
	adminUsers = config.systemSettings.adminUsers;
in
{
	options = {
		systemSettings.security.doas = {
			enable = lib.mkEnableOption "Replace sudo with doas";
		};
	};

	config = lib.mkIf cfg.enable {
		security.doas.enable = true;
		security.sudo.enable = false;
		security.doas.extraRules = [
			{
				users = adminUsers;
				keepEnv = true;
				persist = true;
			}
			{
				users = adminUsers;
				keepEnv = true;
				noPass = true;
				cmd = "nixos-rebuild";
			}
			{
				users = adminUsers;
				keepEnv = true;
				noPass = true;
				cmd = "nix";
			}
			{
				users = adminUsers;
				keepEnv = true;
				noPass = true;
				cmd = "nix-collect-garbage";
			}
		];

		environment.systemPackages = [
			pkgs.doas-sudo-shim
		];
	};
}
