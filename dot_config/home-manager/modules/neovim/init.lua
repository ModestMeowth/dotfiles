vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.conceallevel = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    once = true,
    callback = function()
        vim.api.nvim_clear_autocmds({ group = "FileExplorer" })
    end,
})

local find_files_on_edit = vim.api.nvim_create_augroup("FindFilesOnStartup", { clear = true})
vim.api.nvim_create_autocmd("BufEnter", {
    group = find_files_on_edit,
    pattern = "*",
    callback = function()
        local netrw_bufname

        vim.schedule(function()
            if vim.bo[0].filetype == "netrw" then
                return
            end

            local bufname = vim.api.nvim_buf_get_name(0)
            if vim.fn.isdirectory(bufname) == 0 then
                _, netrw_bufname = pcall(vim.fn.expand, "#:p:h")
                return
            end

            if netrw_bufname == bufname then
                netrw_bufname = nil
                return
            else
                netrw_bufname = bufname
            end

            vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
            require "telescope.builtin".find_files({ cwd = vim.fn.expand("%:p:h") })
        end)
    end,
})

vim.opt.updatetime = 50

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

vim.cmd("colorscheme dracula")
