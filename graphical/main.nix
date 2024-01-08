{ pkgs, home-manager, config, nur, ... }: 
{
	imports = [
		./hyprland/hyprland.nix
		./kitty.nix
		./theme.nix
		./firefox/firefox.nix
		./thunderbird.nix
		./wpaperd/wpaperd.nix
		./waybar/waybar.nix
		./font.nix
		./rofi/rofi.nix
		./discord/discord.nix
		./notification.nix
		./zathura.nix
		./obs.nix
	];
}
