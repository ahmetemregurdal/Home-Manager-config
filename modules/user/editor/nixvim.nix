{pkgs, config, lib, inputs, ...}:

let
cfg = config.userSettings.nixvim;
language = config.userSettings.languages;
in
{
	options = {
		userSettings.nixvim = {
			enable = lib.mkEnableOption "Enable nixvim";
		};
	};

	imports = [ inputs.nixvim.homeModules.nixvim ];

	config = lib.mkIf cfg.enable {
		userSettings.stylix.enable = true;
		stylix.targets.nixvim.enable = true;
		programs.nixvim = {
			enable = true;
			clipboard.providers.wl-copy.enable = true;
			opts = {
				number = true;
				relativenumber = true;
			};
			lsp = {
				inlayHints.enable = true;
				servers = {
					ccls.enable = language.cpp.enable;
				};
			};
			plugins.treesitter = {
				enable = true;
				grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; lib.flatten ([
					[
						bash
						json
						lua
						markdown
						make
						nix
						regex
						toml
						vim
						vimdoc
						xml
						yaml
					]

					(lib.optionals language.cpp.enable [
						cpp
					])
				]);

				settings.highlight.enable = true;
			};
		};
	};
}
