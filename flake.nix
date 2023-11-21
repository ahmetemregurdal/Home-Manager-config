{
	description = "Home Manager configuration of aeg";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "github:hyprwm/Hyprland";
		nur.url = "github:nix-community/NUR";
	};

	outputs = { nixpkgs, nur, home-manager, hyprland, ... }:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		homeConfigurations."aeg" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules = [
				nur.hmModules.nur
				{
					nixpkgs.overlays = [ nur.overlay ];
					nixpkgs.config.allowUnfree = true;
					nixpkgs.config.allowBroken = true;
				}
				hyprland.homeManagerModules.default
				{ wayland.windowManager.hyprland.enable = true; }
				./home.nix
			];
		};
	};
}
