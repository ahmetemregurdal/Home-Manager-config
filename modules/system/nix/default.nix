{config, pkgs, ...}:

{
	config = {
		nix = {
			package = pkgs.nix;
			settings = {
				substituters = [
					"https://cache.nixos.org"
					"https://nix-community.cachix.org"
					"https://niri.cachix.org"
				];
				trusted-public-keys = [
					"niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
					"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
					"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
				];
				auto-optimise-store = true;
				download-buffer-size = 500000000;
			};
		};
	};
}
