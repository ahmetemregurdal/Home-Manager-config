{
	description = "NixOS config flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		niri = {
			url = "github:sodiboo/niri-flake";
		};
		chaotic.url = "github:chaotic-cx/nyx";
	};

	outputs = inputs@{self, nixpkgs, home-manager, niri, chaotic, stylix, ...}:
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hardware-configuration.nix
				./configuration.nix
				home-manager.nixosModules.home-manager
				chaotic.nixosModules.default
				{
					nixpkgs.overlays = [niri.overlays.niri];
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.aeg = ./modules/user/default.nix;
						extraSpecialArgs = {
							inherit inputs;
						};
					};
				}
				./options.nix
				./modules/system/default.nix
			];
			specialArgs = {
				inherit inputs;
			};
		};
	};
}
