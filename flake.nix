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
		chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixcord = {
			url = "github:kaylorben/nixcord";
		};
	};

	outputs = inputs@{self, nixpkgs, home-manager, niri, chaotic, stylix, nixvim, ...}:

	let
		lib = inputs.nixpkgs.lib;
		hosts = builtins.filter (x: x != null) (lib.mapAttrsToList (name: value: if (value == "directory") then name else null) (builtins.readDir ./hosts));
	in
	{
		nixosConfigurations = builtins.listToAttrs
		(map (host: {
		name = host;
		value = lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				{ config.networking.hostName = host; }
				home-manager.nixosModules.home-manager
				chaotic.nixosModules.default
				{
					nixpkgs.overlays = [niri.overlays.niri];
					home-manager.useGlobalPkgs = true;
					home-manager.extraSpecialArgs = {
						inherit inputs;
						inherit nixpkgs;
					};
				}
				(./hosts + "/${host}/default.nix")
				./modules/system/default.nix
			];
			specialArgs = {
				inherit inputs;
			};
		};
		}) hosts);
	};
}
