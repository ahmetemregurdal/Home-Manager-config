{ pkgs, home-manager, config, nur, ... }: 
{
	imports = [
		./hyprland/hyprland.nix
		./kitty.nix
		./theme.nix
		./firefox.nix
		./thunderbird.nix
		./wpaperd/wpaperd.nix
		./waybar/waybar.nix
		./font.nix
		./rofi/rofi.nix
		./discord/discord.nix
		./prismlauncher/prismlauncher.nix
	];
}
