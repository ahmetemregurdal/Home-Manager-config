local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("treesitter.lua")
	return
end

configs.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "yaml" },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	playground = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hypr = {
	install_info = {
		url = "https://github.com/luckasRanarison/tree-sitter-hypr",
		files = { "src/parser.c" },
		branch = "master",
	},
	filetype = "hypr",
}
