local M = {}

local index = 0

tabTerminals = {}

local function tabHasTerminal()
    local currentTerm = vim.api.nvim_tabpage_get_number(0)
    tabTerminals[currentTerm] = "tabMe number "..currentTerm
    P(tabTerminals)
    return false
end

M.setup = function(opts)
    vim.keymap.set(
    "n", opts["keymap"],
        function()
            if tabHasTerminal() then
            else
            end

            index = index +1
        end,
        {})
end

M.setup({keymap= "<leader>n"})

return M
