require("mini.operators").config = {
	evaluate = {
		prefix = 'g=',
		reindent_linewise = true,
	},
	multiply = {
		prefix = 'gm',
		func = nil,
	},
	replace = {
		prefix = 'gr',
		reindent_linewise = true,
	},
	sort = {
		prefix = 'gs',
		func = nil,
	},
}
require("mini.operators").setup()
