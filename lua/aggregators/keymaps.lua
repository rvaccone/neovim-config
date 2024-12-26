
-- lua/aggregators/keymaps.lua
local M = {}

-- Function to aggregate and execute all keymap files from lua/keymaps/
function M.aggregate()
    local keymaps_dir = vim.fn.stdpath('config') .. '/lua/keymaps/'
    local luv = vim.loop

    -- Scan the keymaps directory once and store results
    local handle, err = luv.fs_scandir(keymaps_dir)
    if not handle then
        vim.notify("Failed to scan keymaps directory: " .. keymaps_dir .. "\nError: " .. err, vim.log.levels.ERROR)
        return
    end

    local files = {}
    while true do
        local name, type = luv.fs_scandir_next(handle)
        if not name then break end
        if type == "file" and name:match("%.lua$") then
            table.insert(files, name)
        end
    end

    -- Execute each keymap file
    for _, name in ipairs(files) do
        local filepath = keymaps_dir .. name
        local success, err = pcall(dofile, filepath)
        if not success then
            vim.notify("Failed to execute keymap file: " .. filepath .. "\nError: " .. err, vim.log.levels.ERROR)
        end
    end
end

return M
