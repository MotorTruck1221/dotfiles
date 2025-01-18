-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim", as = "gruvbox" }
  --use { "gleam-lang/gleam.vim", as = "gleam" }
  use { "ziglang/zig.vim" }
  -- use { "rose-pine/neovim", as = "rose-pine" }
  -- use { "sainnhe/everforest", as = "everforest" }
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('habamax/vim-godot')
  --use { 'github/copilot.vim' }
  use { 'tpope/vim-dadbod' }
  use { 'vimsence/vimsence' }
  use {'edluffy/hologram.nvim' }
  use { 'lambdalisue/vim-suda' }
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',
  },
}
  use {
    "NvChad/nvterm",
    config = function ()
        require("nvterm").setup({
            terminals = {
                type_opts = {
                float = {
                    relative = 'editor',
                    row = 0.3,
                    col = 0.25,
                    width = 0.5,
                    height = 0.4,
                    border = "single",
                },
            horizontal = { location = "rightbelow", split_ratio = .3, },
            vertical = { location = "rightbelow", split_ratio = .5 },
        },
    },
    toggle = {
        horizontal = "<leader>tr",
    },
})
        end,
    }


-- install without yarn or npm
--use({
--    "iamcco/markdown-preview.nvim",
--    run = function() vim.fn["mkdp#util#install"]() end,
--})

use({ 'echasnovski/mini.map' })
use({ 'OXY2DEV/markview.nvim' })
--use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }
end)


