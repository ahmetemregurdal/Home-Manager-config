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
	};

	outputs = {self, nixpkgs, home-manager, stylix, ...}@inputs:
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hardware-configuration.nix
				./configuration.nix
				home-manager.nixosModules.home-manager
				stylix.nixosModules.stylix
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.aeg = ./home.nix;
					};
				}
				./options.nix
			];
		};
	};
}
