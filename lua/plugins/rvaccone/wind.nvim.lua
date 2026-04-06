return {
	"rvaccone/wind.nvim",
	---@type WindConfig
	opts = {
		windows = {
			excluded_bufnames = { "^term://.*/%d+:opencode" },
		},
	},
}
