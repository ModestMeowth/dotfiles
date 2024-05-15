vim.keymap.set("n", "Q", "<nop>", {})

vim.keymap.set("v", "<leader>y", '"+y', {})
vim.keymap.set("n", "<leader>y", '"+yy', {})
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', {})
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', {})

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "vv", "V", {})
vim.keymap.set("n", "V", "v$", {})

vim.keymap.set("c", "r!!", "SudaRead %")
vim.keymap.set("c", "w!!", "SudaWrite %")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
