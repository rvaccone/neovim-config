return {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			skip_unbalanced = true,
			surrounds = {
				["$"] = { -- interpolation
					add = { "${", "}" },
				},
				["c"] = { -- console.log
					add = { "console.log(", ")" },
				},
				["d"] = { -- div
					add = { '<div className="">', "</div>" },
				},
				["j"] = { -- jsx template literal
					add = { "{`", "`}" },
				},
				["m"] = { -- jsx comment
					add = { "{/*", "*/}" },
				},
				["p"] = { -- promise
					add = { "Promise<", ">" },
				},
				["y"] = { -- try/catch
					add = { "try {", "} catch (error: unknown) { console.error(error); }" },
				},
			},
		})
	end,
}
