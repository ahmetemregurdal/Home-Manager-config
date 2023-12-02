{
	description = "Home Manager configuration of aeg";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nur.url = "github:nix-community/NUR";

		nix-index-database = {
			url = "github:Mic92/nix-index-database";
			inputs.nixpkgs.follows = "nixpkgs";
		};
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
				{
					nixpkgs.overlays = [ nur.overlay ];
					nixpkgs.config.allowUnfree = true;
					nixpkgs.config.allowBroken = true;
				}
				./home.nix
				nix-index-database.hmModules.nix-index
			];
		};
	};
}
