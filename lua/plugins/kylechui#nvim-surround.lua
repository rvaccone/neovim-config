-- Setup localized vim variables
local bo = vim.bo

return {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function()
		-- Get surround pattern for current filetype
		local function get_pattern(patterns)
			local filetype = bo.filetype
			return patterns[filetype] or patterns["typescript"] or { "", "" }
		end

		require("nvim-surround").setup({
			skip_unbalanced = true,
			surrounds = {
				["$"] = { -- interpolation
					add = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { "${", "}" },
							["javascriptreact"] = { "${", "}" },
							["typescript"] = { "${", "}" },
							["typescriptreact"] = { "${", "}" },

							-- Lua
							["lua"] = { "$(", ")" },

							-- Python
							["python"] = { "{", "}" },

							-- Shell
							["bash"] = { "${", "}" },
							["sh"] = { "${", "}" },
							["zsh"] = { "${", "}" },
						}

						return get_pattern(patterns)
					end,
				},
				["c"] = { -- Comment
					add = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { "/* ", " */" },
							["javascriptreact"] = { "{/* ", " */}" },
							["typescript"] = { "/* ", " */" },
							["typescriptreact"] = { "{/* ", " */}" },

							-- Lua
							["lua"] = { "--[[ ", " ]]" },

							-- Python
							["python"] = { '"""', '"""' },
						}

						return get_pattern(patterns)
					end,
				},
				["d"] = { -- div
					add = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascriptreact"] = { '<div className="">', "</div>" },
							["typescriptreact"] = { '<div className="">', "</div>" },

							-- HTML
							["html"] = { "<div>", "</div>" },
						}

						return get_pattern(patterns)
					end,
				},
				["D"] = { -- view
					add = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascriptreact"] = { '<View className="">', "</View>" },
							["typescriptreact"] = { '<View className="">', "</View>" },
						}

						return get_pattern(patterns)
					end,
				},
				["l"] = { -- log
					add = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { "console.log(", ")" },
							["javascriptreact"] = { "console.log(", ")" },
							["typescript"] = { "console.log(", ")" },
							["typescriptreact"] = { "console.log(", ")" },

							-- Lua
							["lua"] = { "print(", ")" },

							-- Python
							["python"] = { "print(", ")" },
						}

						return get_pattern(patterns)
					end,
				},
				["p"] = { -- promise
					add = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { "Promise<", ">" },
							["javascriptreact"] = { "Promise<", ">" },
							["typescript"] = { "Promise<", ">" },
							["typescriptreact"] = { "Promise<", ">" },

							-- Python
							["python"] = { "Awaitable[", "]" },
						}

						return get_pattern(patterns)
					end,
				},
				["y"] = { -- try
					add = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { "try {", "} catch (error) { console.error(error); }" },
							["javascriptreact"] = { "try {", "} catch (error) { console.error(error); }" },
							["typescript"] = { "try {", "} catch (error: unknown) { console.error(error); }" },
							["typescriptreact"] = { "try {", "} catch (error: unknown) { console.error(error); }" },

							-- Lua
							["lua"] = { "pcall(function() ", " end)" },
						}

						return get_pattern(patterns)
					end,
				},
			},
		})
	end,
}
