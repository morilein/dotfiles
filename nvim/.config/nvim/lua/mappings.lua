local vim = vim
local keymap = vim.api.nvim_set_keymap
local wk = require 'which-key'

vim.g.mapleader = ' '

-- Normal Mode {{{
wk.register({
    ['<leader>'] = {
-- File {{{
        f = {
            name = 'File',
            ['.'] = { [[<cmd>:lua require("telescope.builtin").find_files( { cwd = vim.fn.expand("%:p:h") })<cr>]], 'File ./', noremap = true},
            f = { [[<cmd>:lua require("telescope.builtin").find_files{ find_command = { "rg", "--files", "--hidden", "--ignore", "-g", "!.git/*" } }<cr>]], 'File', noremap = true },
            g = { [[<cmd>Telescope live_grep theme=ivy<cr>]], 'Grep', noremap = true },
            b = { [[<cmd>Telescope file_browser theme=ivy<cr>]], 'Browser', noremap = true },
            r = { [[<cmd>Telescope oldfiles theme=ivy<cr>]], 'Recent', noremap = true },
        },
-- }}}
-- Buffers {{{
        b = {
            name = 'Buffer',
            b = { [[<cmd>Telescope buffers theme=ivy<cr>]], 'Buffers', noremap = true },
        },
-- }}}
-- Project {{{
        p = {
            name = 'Project',
            p = { [[<cmd>Telescope projects theme=ivy<cr>]], 'Projects', noremap = true },
        },
-- }}}
-- Git {{{
        g = {
            name = 'Git',
            g = { [[<cmd>Neogit<cr>]], 'Neogit', noremap = true },
        },
-- }}}
-- LSP {{{
        l = {
            name = 'LSP',
            t = { [[<cmd>TroubleToggle<cr>]], 'Show Quickfix', silent = true },
            i = { [[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'Goto Implementation', silent = true, noremap = true },
            f = { [[<cmd>lua vim.lsp.buf.formatting()<CR>]], 'Format Buffer', silent = true, noremap = true },
            l = { [[<cmd>lua print(vim.lsp.buf.server_ready())<CR>]], 'Lsp Status', silent = true, noremap = true },
            r = { [[<cmd>lua vim.lsp.buf.rename()<cr>]], 'Rename', silent = true, noremap = true },
            a = { [[<cmd>lua vim.lsp.buf.code_action()<cr>]], 'Code Action', silent = true, noremap = true },
            d = { [[<cmd>lua vim.lsp.buf.definition()<cr>]], 'Find Definition', silent = true, noremap = true },
            -- p = { [[<cmd>Lspsaga preview_definition<cr>]], 'Preview Definition', silent = true, noremap = true },
        },
-- }}}
    }
}, { mode = 'n' } )

keymap('n', 'ga', [[<Plug>(EasyAlign)]], {})
keymap('n', '<c-j>', [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], {noremap = true })
--}}}
-- Visual Mode {{{
keymap('x', 'ga', [[<Plug>(EasyAlign)]], {})
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
