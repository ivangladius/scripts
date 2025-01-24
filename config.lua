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

lvim.keys.normal_mode["<M-b>"] = "<cmd>NvimTreeFocus<CR>"

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
-- lvim.keys.normal_mode["<M-b>"] = ":RustRun<CR>"

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

-- local opts = {
--     settings = {
--         ["rust-analyzer"] = {
--             lens = {
--                 enable = false,
--             },
--             checkOnSave = {
--                 enable = true,
--                 command = "clippy",
--             }
--         },
--         ["jdtls"] = {
--             lens = {
--                 enable = false,
--             },
--         }
--     }
-- }

-- require('lvim.lsp.manager').setup("rust_analyzer", opts)
-- require('lvim.lsp.manager').setup("jdtls", opts)

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
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "permissions",
          "size",
          "mtime",
          "icon",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = false,
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = true,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        prompt_save_on_select_new_entry = true,
        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 2000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        lsp_file_methods = {
          autosave_changes = false,
        },
        -- Constrain the cursor to the editable parts of the oil buffer
        -- Set to `false` to disable, or "name" to keep it on the file names
        constrain_cursor = "editable",
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["l"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["h"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })

      -- Oil keybindings
      local map = vim.keymap.set
      map('n', '<leader>j', ':Oil<CR>', {})
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
      "nvim-telescope/telescope-dap.nvim"
    },
    config = function()
      -- DAP Setup
      local dap = require('dap')
      local dapui = require('dapui')
      local dap_virtual_text = require('nvim-dap-virtual-text')
      local dap_go = require('dap-go')
      local dap_python = require('dap-python')

      -- DAP UI setup
      dapui.setup({
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
          }
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" }
          }
        },
        force_buffers = true,
        icons = {
          collapsed = "",
          current_frame = "",
          expanded = ""
        },
        layouts = { {
          elements = { {
            id = "scopes",
            size = 1 
          },
            -- {
            --   id = "breakpoints",
            --   size = 0.25
            -- }, {
            --   id = "stacks",
            --   size = 0.25
            -- }, {
            --   id = "watches",
            --   size = 0.25
            -- }
          },
          position = "bottom",
          size = 10
        },
          {
            elements = {
              {
                id = "stacks",
                size = 1
              },{
                id = "watches",
                size = 0.25
              },
              --   id = "repl",
              --   size = 0.5
              -- }, {
              --   id = "console",
              --   size = 0.5
            },
            position = "right",
            size = 60
          }},
        mappings = {
          edit = "e",
          -- expand = { "<CR>", "<2-LeftMouse>" },
          expand = { "<CR>", "<LeftRelease>", "<TAB>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t"
        },
        render = {
          indent = 1,
          max_value_lines = 100
        }
      })

      -- DAP Virtual Text setup
      dap_virtual_text.setup {
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = true,
        only_first_definition = true,
        all_references = false,
        clear_on_continue = false,
        display_callback = function(variable, buf, stackframe, node, options)
          if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value
          else
            return variable.name .. ' = ' .. variable.value
          end
        end,
        virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil
      }

      -- DAP Go setup
      dap_go.setup({
        dap_configurations = {
          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          port = "${port}",
          args = {},
          build_flags = "",
        },
      })

      -- DAP Python setup
      dap_python.setup('/usr/bin/python3')  -- Update this line to your Python path with debugpy

      -- DAP Keybindings
      vim.api.nvim_set_keymap("n", "<leader>di", ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<M-]>', ":DapToggleBreakpoint<CR>", {})
      vim.keymap.set('n', '<M-9>', ":DapStepOut<CR>", {})
      vim.keymap.set('n', '<M-0>', ":DapStepOver<CR>", {})
      vim.keymap.set('n', '<M-->', ":DapStepIn<CR>", {})
      vim.keymap.set('n', '<M-=>', ":DapContinue<CR>", {})
      vim.keymap.set('n', '<M-+>', ":DapTerminate<CR>", {})

      -- DAP Telescope integration
      require('telescope').load_extension('dap')
      vim.keymap.set('n', '<leader>dc', ":lua require'telescope'.extensions.dap.commands{}<CR>", {})
      vim.keymap.set('n', '<leader>df', ":lua require'telescope'.extensions.dap.frames{}<CR>", {})
      vim.keymap.set('n', '<leader>db', ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", {})
      vim.keymap.set('n', '<leader>de', ":lua require('dapui').eval()<CR>", {})
    end
  }

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
