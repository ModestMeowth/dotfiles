return {
    "lambdalisue/suda.vim",
    config = function()
        vim.keymap.set("c", "w!!", "SudaWrite %")
    end
}
