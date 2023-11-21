require("mini.comment").config = {
	options = {
		custom_commentstring = nil,
		ignore_blank_line = false,
		start_of_line = false,
		pad_comment_parts = true,
	},
	mappings = {
		comment = 'gc',
		comment_line = 'gcc',
		comment_visual = 'gc',
		textobject = 'gc',
	},
}
require("mini.comment").setup()
