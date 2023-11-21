{home-manager, config, pkgs, ...}:
{
	home.packages = with pkgs; [
		prismlauncher-qt5
	];
	home.file.".local/share/PrismLauncher/accounts.json" = {
		enable = true;
		source = ./accounts.json;
		target = ".local/share/PrismLauncher/accounts.json";
	};
}
