local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        f = {
            name = "File",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
            r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
            h = { "Help Files" }
        },

        l = {
            name = "Lsp",
            r = { "vim.lsp.buf.rename()", "Rename" },
            a = { "vim.lsp.buf.code_action()", "Code Action" },
            f = { "vim.lsp.buf.format()", "Format" }
        },

        b = {
            name = "Buffers",
            n = { ":bn<CR>", "Next Buffer" },
            p = { ":bp<CR>", "Previous Buffer" },
            d = { ":bd<CR>", "Delete Buffer" },
            b = { ":Telescope buffers<CR>", "List Buffers" }
        },

        e = { "+Explorer" },

        v = {
            name = "View",
            d = { "Diagnostics" },
        }
    },

    ["g"] = {
        d = { "Go to definition" },
        D = { "Go to declaration" },
        i = { "Go to implementation" },
        s = { "Go to signature" },
    },



})
