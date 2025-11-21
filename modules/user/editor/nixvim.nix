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
			editorconfig.enable = true;
			clipboard.providers.wl-copy.enable = true;
			opts = {
				number = true;
				relativenumber = true;
				tabstop = 2;
				shiftwidth = 2;
				smartindent = true;
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

			plugins.mini-starter = {
				enable = true;
				settings = {
					header = ''
███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
						'';

				};
			};

			plugins.mini-icons.enable = true;

			plugins.mini-completion.enable = true;

			plugins.lspconfig.enable = true;

			plugins.mini-ai.enable = true;

			plugins.mini-clue.enable = true;

			plugins.mini-comment.enable = true;

			plugins.mini-statusline.enable = true;
		};
	};
}
