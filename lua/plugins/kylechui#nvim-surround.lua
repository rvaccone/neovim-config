-- Setup localized vim variables
local bo = vim.bo

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
					add = { "{/* ", " */}" },
				},
				["p"] = { -- promise
					add = { "Promise<", ">" },
				},
				["y"] = { -- try
					add = function()
						local filetype = bo.filetype

						local patterns = {
							-- JavaScript
							["javascript"] = { "try {", "} catch (error) { console.error(error); }" },
							["javascriptreact"] = { "try {", "} catch (error) { console.error(error); }" },

							-- TypeScript
							["typescript"] = { "try {", "} catch (error: unknown) { console.error(error); }" },
							["typescriptreact"] = { "try {", "} catch (error: unknown) { console.error(error); }" },

							-- Lua
							["lua"] = { "pcall(function() ", " end)" },
						}

						return patterns[filetype] or patterns["typescript"]
					end,
				},
			},
		})
	end,
}
