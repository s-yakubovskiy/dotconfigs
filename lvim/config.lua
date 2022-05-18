-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "palenight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["Q"] = "<NOP>"
lvim.keys.normal_mode["<S-Tab>"] = ":bnext<CR>"
lvim.keys.normal_mode["<Tab>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<S-F>"] = ":RnvimrToggle<CR>"
-- add your own keymapping
-- lvim.builtin.dashboard.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.float_opts = {
  border = "curved",
  width = 170,
  height = 41,
  winblend = 0,
  highlights = {
    border = "Normal",
    background = "Normal",
  },
}
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "gomod",
  "dockerfile",
  "dot",
  "go",
  "markdown",
  "toml",
  "make",
  "hcl",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
-- vim.opt.completeopt = { "menuone" "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
-- vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
-- vim.opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}


-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" }
-- lvim.builtin.which_key.mappings["T"] = { ":TodoQuickFix<CR>", "ToDo quick fix" }
lvim.builtin.which_key.mappings["t"] = { ":TodoQuickFix<CR>", "ToDo quick fix" }
lvim.builtin.which_key.mappings["-"] = { ":RnvimrToggle<CR>", "Ranger Explorer" }
lvim.builtin.which_key.mappings["a"] = { "<cmd>lua _lazygit_toggle()<CR>", "GitUI" }
-- lvim.keys.normal_mode["<S-F>"] = ":Glow<CR>"

lvim.builtin.which_key.mappings["t"] = {
  name = "todotroubles",
  t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
  T = { ":TodoQuickFix<CR>", "ToDo quick fix" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings["F"] = {
  name = "Find&Replace",
  s = { ":lua require('spectre').open()<CR>", "Find and Replace with Spectre" },
}


-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["v"] = {
  name = "Visuals",
  v = { "<cmd>ZenMode<CR>", "ZenMode" },
  g = { "<cmd>:Glow<cr>", "Glow MD" },
  b = { "<cmd>:GitBlameToggle<cr>", "GitBlameToggle" },
  i = { "<cmd>:IndentBlanklineToggle<cr>", "Indent Toggle" },
  s = { "<cmd>:LspStop<cr>", "Stop Lsp Server" },
  c = { "<cmd>:set list!<cr>", "toggle list" },
}

lvim.builtin.bufferline.active = true
lvim.builtin.lualine.active = true
lvim.builtin.dap.active = false
lvim.builtin.telescope.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75

-- generic LSP settings
lvim.lsp.automatic_servers_installation = true
--
-- treesitter bug from https://github.com/LunarVim/LunarVim/issues/1867
lvim.builtin.treesitter.indent = { enable = true, disable = { "python" } }

-- local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_configs.hcl = {
--   filetype = "hcl", "terraform",
-- }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "autopep8", filetypes = { "py", "python" } },
  { command = "goimports" },
  {
    command = "prettier",
    args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "markdown", "graphql", "yaml", "yml", "hcl" },
    -- filetypes = { "typescript", "typescriptreact", "yaml" },
  },
  -- {
  --   exe = "hclfmt",
  --   filetypes = { "hcl" },
  -- },
  -- {
  --   command = "terraform_fmt",
  --   args = { "fmt", "-" },
  --   filetypes = { "hcl" },
  -- },
}
-- lvim.lang.go.formatter.exe = "goimports"
-- lvim.lang.go.formatters = {
--   {
--     exe = "goimports",
--   }
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "folke/tokyonight.nvim",
    -- config = function()
    --   vim.g.tokyonight_style = "storm"
    --   vim.g.tokyonight_italic_functions = false
    --   vim.g.tokyonight_colors = {
    --     hint = "orange",
    --     orange = "red",
    --     error = "#ff0000",
    --     green = "#bde69e",
    --     green1 = "#89ddff",
    --     green2 = "red",
    --     blue1 = "orange",
    --     yellow = "#fde998",
    --     -- blue1 = "#ffd732",
    --     blue = "cyan",
    --     bg_dark = "#ffe26a",
    --     -- fg = "#89ddff",
    --     fg = "#fff",
    --     -- fg = "#d0d0d0",
    --   }
    --   vim.cmd "colorscheme tokyonight"
    --   end,
  },
  { "christianchiarulli/nvcode-color-schemes.vim" },
  { "sindrets/diffview.nvim" },
  -- {"sainnhe/sonoka"},
  { "sainnhe/edge" },
  { "nxvu699134/vn-night.nvim" },
  { "dracula/vim" },
  { "shaunsingh/nord.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
      vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', { noremap = true, silent = true })
      vim.cmd "let g:rnvimr_layout = {'relative': 'editor', 'width': float2nr(round(0.9 * &columns)), 'height': float2nr(round(0.9 * &lines)), 'col': float2nr(round(0.05 * &columns)), 'row': float2nr(round(0.05 * &lines)), 'style': 'minimal'}"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {
    "fatih/vim-hclfmt"
  },
  {
    "kdheepak/lazygit.nvim"
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
  },
  {
    "p00f/nvim-ts-rainbow",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end,
  },
  -- {
  --   "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd "highlight default link gitblame SpecialComment"
  --     vim.g.gitblame_enabled = 0
  --     vim.cmd "GitBlameToggle"
  --     vim.cmd "GitBlameToggle"
  --   end,
  -- },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    event = "BufRead",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          height = 0.85, -- height of the Zen window
          options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
          },
        },
        plugins = {
          gitsigns = { enabled = false }, -- disables git signs
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        },
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "s-yakubovskiy/vim-gx",
    event = "BufRead",
  },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "towolf/vim-helm",
  },
  {
    "lepture/vim-jinja",
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*", "set listchars=tab:→\\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»" },
  -- { "BufWinLeave", "*", "mkview" },
  -- { "BufWrite", "*", "mkview" },
  -- { "BufWinEnter", "*", "silent! loadview" },
  -- { "BufWrite", "*.hcl", "execute '!hclfmt'" },
  -- { "BufWrite", "*.hcl", "HclFmt" },
}
-- lvim.autocommands.custom_groups = {
--   { "BufWinLeave", "*", "mkview" },
--   { "BufWinEnter", "*", "silent! loadview" },
-- }
