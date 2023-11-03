-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- 

lvim.keys.normal_mode["<leader>1"] = ":only<CR>"
lvim.keys.normal_mode["<leader>2"] = ":sp<CR>"
lvim.keys.normal_mode["<leader>3"] = ":vsp<CR>"
lvim.keys.normal_mode["<leader>4"] = "<C-w>="

lvim.keys.normal_mode["<M-.>"] = "<C-d>zz"
lvim.keys.normal_mode["<M-,>"] = "<C-u>zz"

lvim.keys.normal_mode["<M-o>"] = "<C-o>"
lvim.keys.normal_mode["<M-u>"] = "<C-i>"

lvim.keys.normal_mode["<M-q>"] = ":q!<CR>"
lvim.keys.normal_mode["<M-w>"] = ":w!<CR>"

lvim.keys.normal_mode["<M-h>"] = ":wincmd h<CR>"
lvim.keys.normal_mode["<M-j>"] = ":wincmd j<CR>"
lvim.keys.normal_mode["<M-k>"] = ":wincmd k<CR>"
lvim.keys.normal_mode["<M-l>"] = ":wincmd l<CR>"

lvim.keys.normal_mode["<M-p>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<M-n>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>k"] = ":BufferKill <CR>"

lvim.builtin.which_key.mappings["e"] = {
  "<cmd>NvimTreeFocus<CR>", "Tree"
}

-- lvim.builtin.which_key.mappings["lq"] = {
--  "<cmd> lua require('telescope.builtin').lsp_references<CR>"
-- }

lvim.keys.normal_mode["<C-M-H>"] = ":NvimTreeResize -1<CR>"
lvim.keys.normal_mode["<C-M-L>"] = ":NvimTreeResize +1<CR>"

--nvim.keymap.set('n', 'fr', 
--lvim.keys.normal_mode["<C-M-L>"] =
--vim.api.nvim_set_keymap("n", "<leader>oo", require('telescope.builtin').lsp_references, { noremap = true, silent = true})
--  { noremap = true, silent = true })

lvim.keys.normal_mode["<leader>oo"] = "<cmd> lua require('telescope.builtin').lsp_references()<CR>"
-- Rust
lvim.keys.normal_mode["<M-b>"] = ":RustRun<CR>"

-- require('cmp').setup({
--     -- Default setup in README.md
--     preselect = require('cmp').PreselectMode.None,
--     complete = {
--         completeopt=menu,menuone,noinsert,noselect
--     },
-- })

-- require('cmp').setup({ confirmation = { completeopt = 'menu,menuone,noinsert' } })


local cmp = require('cmp')
cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
})

local opts = {
    settings = {
        ["rust-analyzer"] = {
            lens = {
                enable = false,
            },
            checkOnSave = {
                enable = true,
                command = "clippy",
            }
        },
        ["jdtls"] = {
            lens = {
                enable = false,
            },
        }
    }
}

require('lvim.lsp.manager').setup("rust_analyzer", opts)
require('lvim.lsp.manager').setup("jdtls", opts)

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

vim.api.nvim_create_user_command('IvanSnipeCopyWord',
function(opts)
  vim.cmd.HopChar1MW()
  vim.cmd('normal! yiw')
  vim.cmd.execute [["normal \<c-o>"]]
end, {}
)

vim.api.nvim_create_user_command('IvanSnipeCopyWholeWord',
function(opts)
  vim.cmd.HopChar1MW()
  vim.cmd('normal! yiW')
  vim.cmd.execute [["normal \<c-o>"]]
end, {}
)

lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar1MW<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "9", ":IvanSnipeCopyWord<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>9", ":IvanSnipeCopyWholeWord<cr>", { silent = true })
    end,
  },
  {
    "plan9-for-vimspace/acme-colors"
  },
}

--vim.o.background = "dark"
--lvim.colorscheme = "darkblue"

vim.cmd "au ColorScheme * hi CursorLine ctermbg=none guibg=none"

-- C & C++ DAP
local dap = require('dap')
--dap.adapters.codelldb = {
--  type = 'server',
--  host = '127.0.0.1',
--  port = 13000 -- 💀 Use the port printed out or specified with `--port`
--}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/usr/bin/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.c= {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
