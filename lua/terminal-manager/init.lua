local M = {}

local index = 0

M.tabTerminals = {}

local function deleteTabTermReference(tabNum)
    M.tabTerminals[tabNum] = nil
end

local function addBufDeleteAugroup(tabNum, bufNum)
    vim.api.nvim_create_autocmd({ "BufDelete" }, {
        buffer = bufNum,
        callback = function()
            deleteTabTermReference(tabNum)
        end,
    })

end

local function toggleTerminal()
    local tabNumber = vim.api.nvim_tabpage_get_number(0)
    if M.tabTerminals[tabNumber] == nil then
        vim.cmd("below split|term")
        local bufNum = vim.api.nvim_buf_get_number(0)
        M.tabTerminals[tabNumber] = bufNum
        addBufDeleteAugroup(tabNumber, bufNum)
    else
    end

    index = index + 1
end

local function debug()
    P(M.tabTerminals)
end

M.setup = function(opts)
    if opts then
        if opts["keymap"] == nil then
            error("You must provide 'keymap' opt to terminal-manager.setup()")
        end
        vim.keymap.set(
            "n", opts["keymap"],
            toggleTerminal,
            {})
        vim.keymap.set(
            "n", opts["debug"],
            debug,
            {})
        return
    else
        error("You must provide 'keymap' opt to terminal-manager.setup()")
    end
end


M.setup({ keymap = "<leader>n", debug = "<leader>nd" })
-- M.setup({})

-- tabHasTerminal()

return M
