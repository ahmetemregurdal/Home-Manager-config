{
	description = "Home Manager configuration of aeg";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nur = {
			url = "github:nix-community/NUR";
		};
		nix-index-database = {
			url = "github:Mic92/nix-index-database";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	nixConfig = {
		experimental-features = [ "nix-command" "flakes" ];
		substituters = [ "https://cache.nixos.org/" ];
		extra-substituters = [ "https://nix-community.cachix.org" ];
		extra-trusted-public-keys = [
			"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
		];

	};

	outputs = { nixpkgs, nur, home-manager, nix-index-database, ... }:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		homeConfigurations."aeg" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules = [
				nur.hmModules.nur
				nix-index-database.hmModules.nix-index
				{
					nixpkgs.overlays = [ nur.overlay ];
					nixpkgs.config.allowUnfree = true;
					nixpkgs.config.allowBroken = true;
				}
				./home.nix
			];
		};
	};
}
