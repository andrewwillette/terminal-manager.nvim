local M = {}

local index = 0

local function tabHasTerminal()

    return false
end

M.setup = function(opts)

    vim.keymap.set(
    "n", opts["keymap"],
        function()
            if tabHasTerminal()

            else
            end

            print("calling me "..index)
            index = index +1
        end,
        {})
end

return M
