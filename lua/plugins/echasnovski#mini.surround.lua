-- Setup localized vim variables
local bo = vim.bo

return {
	"echasnovski/mini.surround",
	version = "*",

	config = function()
		---@alias SurroundInput string[]
		---@alias SurroundOutput { left: string, right: string }
		---@alias SurroundPatterns table<string, SurroundOutput|SurroundInput>

		---Get surround pattern for current filetype with fallback support
		---@param patterns SurroundPatterns
		---@param return_type "input"|"output"
		---@return SurroundInput|SurroundOutput
		local function get_pattern(patterns, return_type)
			local filetype = bo.filetype

			-- Direct match
			if patterns[filetype] then
				return patterns[filetype]
			end

			-- Language family fallbacks
			local fallbacks = {
				-- JavaScript
				["javascriptreact"] = "javascript",
				["typescript"] = "javascript",
				["typescriptreact"] = "typescript",

				-- Shell
				["zsh"] = "bash",
				["fish"] = "bash",
			}

			-- Fallback to language family
			local fallback = fallbacks[filetype]
			if fallback and patterns[fallback] then
				return patterns[fallback]
			end

			return return_type == "input" and { "" } or { left = "", right = "" }
		end

		require("mini.surround").setup({
			custom_surroundings = {
				["$"] = { -- interpolation
					output = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { left = "${", right = "}" },
							["javascriptreact"] = { left = "${", right = "}" },
							["typescript"] = { left = "${", right = "}" },
							["typescriptreact"] = { left = "${", right = "}" },

							-- Lua
							["lua"] = { left = "$(", right = ")" },

							-- Python
							["python"] = { left = "{", right = "}" },

							-- Shell
							["bash"] = { left = "${", right = "}" },
							["sh"] = { left = "${", right = "}" },
							["zsh"] = { left = "${", right = "}" },
						}

						return get_pattern(patterns, "output")
					end,
				},
				["c"] = { -- Comment
					output = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { left = "/* ", right = " */" },
							["javascriptreact"] = { left = "{/* ", right = " */}" },
							["typescript"] = { left = "/* ", right = " */" },
							["typescriptreact"] = { left = "{/* ", right = " */}" },

							-- Lua
							["lua"] = { left = "--[[ ", right = " ]]" },

							-- Python
							["python"] = { left = '"""', right = '"""' },
						}

						return get_pattern(patterns, "output")
					end,
				},
				["d"] = { -- div
					output = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascriptreact"] = { left = '<div className="">\n', right = "\n</div>" },
							["typescriptreact"] = { left = '<div className="">\n', right = "\n</div>" },

							-- HTML
							["html"] = { left = "<div>\n", right = "\n</div>" },
						}

						return get_pattern(patterns, "output")
					end,
				},
				["D"] = { -- view
					output = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascriptreact"] = { left = '<View className="">\n', right = "\n</View>" },
							["typescriptreact"] = { left = '<View className="">\n', right = "\n</View>" },
						}

						return get_pattern(patterns, "output")
					end,
				},
				["l"] = { -- log
					output = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { left = "console.log(", right = ")" },
							["javascriptreact"] = { left = "console.log(", right = ")" },
							["typescript"] = { left = "console.log(", right = ")" },
							["typescriptreact"] = { left = "console.log(", right = ")" },

							-- Lua
							["lua"] = { left = "print(", right = ")" },

							-- Python
							["python"] = { left = "print(", right = ")" },
						}

						return get_pattern(patterns, "output")
					end,
				},
				["p"] = { -- promise
					output = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { left = "Promise<", right = ">" },
							["javascriptreact"] = { left = "Promise<", right = ">" },
							["typescript"] = { left = "Promise<", right = ">" },
							["typescriptreact"] = { left = "Promise<", right = ">" },

							-- Python
							["python"] = { left = "Awaitable[", right = "]" },
						}

						return get_pattern(patterns, "output")
					end,
				},
				["t"] = {
					input = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascriptreact"] = { "<%w+[^>]*>().-()</[^>]*>", "<%w+[^/>]*/>" },
							["typescriptreact"] = { "<%w+[^>]*>().-()</[^>]*>", "<%w+[^/>]*/>" },

							-- HTML
							["html"] = { "<%w+[^>]*>().-()</[^>]*>", "<%w+[^/>]*/>" },
						}

						return get_pattern(patterns, "input")
					end,
					output = function()
						local tag = require("mini.surround").user_input("Tag name: ")
						if not tag then
							return nil
						end
						return { left = "<" .. tag .. ">", right = "</" .. tag .. ">" }
					end,
				},
				["T"] = {
					output = function()
						local tag = require("mini.surround").user_input("Tag name: ")
						if not tag then
							return nil
						end
						return { left = "<" .. tag .. ' className="">', right = "</" .. tag .. ">" }
					end,
				},
				["y"] = { -- try
					input = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = { "try%s*{().-(}%s*catch)" },
							["javascriptreact"] = { "try%s*{().-(}%s*catch)" },
							["typescript"] = { "try%s*{().-(}%s*catch)" },
							["typescriptreact"] = { "try%s*{().-(}%s*catch)" },

							-- Lua
							["lua"] = { "pcall%s*%(function%s*%(%s*%)().-%send%s*%)" },
						}

						return get_pattern(patterns, "input")
					end,
					output = function()
						local patterns = {
							-- JavaScript/TypeScript
							["javascript"] = {
								left = "try {\n\t",
								right = "\n} catch (error) {\n\tconsole.error(error);\n}",
							},
							["javascriptreact"] = {
								left = "try {\n\t",
								right = "\n} catch (error) {\n\tconsole.error(error);\n}",
							},
							["typescript"] = {
								left = "try {\n\t",
								right = "\n} catch (error: unknown) {\n\tconsole.error(error);\n}",
							},
							["typescriptreact"] = {
								left = "try {\n\t",
								right = "\n} catch (error: unknown) {\n\tconsole.error(error);\n}",
							},

							-- Lua
							["lua"] = { left = "pcall(function()\n\t", right = "\nend)" },
						}

						return get_pattern(patterns, "output")
					end,
				},
			},

			mappings = {
				add = "sa",
				delete = "sd",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",

				suffix_last = "p", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			search_method = "cover_or_next",

			respect_selection_type = true,
		})
	end,
}
