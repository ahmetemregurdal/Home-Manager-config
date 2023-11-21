{ pkgs, home-manager, config, ... }:
{
	programs.neovim = {
		enable = true;
		withNodeJs = true;
		withRuby = true;
		withPython3 = true;
		defaultEditor = true;
		extraLuaConfig = builtins.readFile ./init.lua;
	};
	home.packages = with pkgs; [
		wl-clipboard
		clang-tools
		cmake-language-server
		dart
		fortls
		java-language-server
		kotlin-language-server
		ltex-ls
		lua-language-server
		nodePackages.grammarly-languageserver
		nodePackages.pyright
		nodePackages.vim-language-server
		nodePackages.vscode-langservers-extracted
		omnisharp-roslyn
		rnix-lsp
		rust-analyzer
		nodePackages.bash-language-server
	];
	home.file.".config/nvim/lua/user" = {
		enable = true;
		source = ./lua;
		recursive = true;
		target = ".config/nvim/lua/user";
	};
}
