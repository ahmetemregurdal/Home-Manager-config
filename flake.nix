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
			inputs.nixpkgs.follows = "nixpkgs";
		};
		chaotic = {
			url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixcord = {
			url = "github:kaylorben/nixcord";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		vlc = {
			url = "path:./overlays/vlc";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{self, nixpkgs, home-manager, niri, chaotic, vlc, ...}:

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
					nixpkgs.overlays = [
						niri.overlays.niri
						(final: prev: {
							libvlc = vlc.packages."x86_64-linux".vlc-optimized;
						})
					];
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
