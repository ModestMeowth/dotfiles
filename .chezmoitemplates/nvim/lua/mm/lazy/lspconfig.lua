return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend("force", {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        local cmp_select = {
            behavior = cmp.SelectBehavior.Select,
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),

            source = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        lspconfig.bashls.setup {}
        lspconfig.nil_ls.setup {}
        lspconfig.vimls.setup {}
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                            "it",
                            "describe",
                            "before_each",
                            "after_each",
                        },
                    }
                }
            }
        }

        lspconfig.yamlls.setup {}
        lspconfig.taplo.setup {}
        lspconfig.jsonls.setup {
            cmd = {
                "vscode-json-languageserver", "--stdio"
            }
        }

        lspconfig.dockerls.setup {}
        lspconfig.ansiblels.setup {}
        lspconfig.terraformls.setup {}

        lspconfig.pyright.setup {}
        lspconfig.gopls.setup {}
        lspconfig.rust_analyzer.setup {}
        lspconfig.tsserver.setup {}
        lspconfig.clangd.setup {}
        lspconfig.zls.setup {}

        lspconfig.marksman.setup {}
        lspconfig.ltex.setup {}

        lspconfig.html.setup {
            cmd = {
                "html-languageserver", "--stdio"
            }
        }
        lspconfig.cssls.setup {
            cmd = {
                "css-languageserver", "--stdio"
            }
        }
        lspconfig.tailwindcss.setup {}
        lspconfig.htmx.setup {}


    end
}
