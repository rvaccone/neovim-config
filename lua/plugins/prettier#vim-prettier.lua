-- Setup localized vim variables
local fn = vim.fn
local g = vim.g

return {
	"prettier/vim-prettier",
	build = "yarn install --frozen-lockfile --production",
	config = function()
		g["prettier#autoformat"] = 1
		g["prettier#autoformat_require_pragma"] = 0

		-- Define a function to check for local prettier installation
		local function get_local_prettier_path()
			local local_prettier_path = fn.getcwd() .. "/node_modules/.bin/prettier"
			if fn.filereadable(local_prettier_path) == 1 then
				return local_prettier_path
			else
				return fn.system("which prettier"):gsub("\n", "")
			end
		end

		g["prettier#exec_cmd_path"] = get_local_prettier_path()
	end,
}
