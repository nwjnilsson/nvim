return {
  -- Packer can manage itself
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },


--  use {
--	 'nvim-treesitter/nvim-treesitter',
--	  build = function()
--		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
--		  ts_update()
--	  end,
--  }

  {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate'
  },
  
  'rebelot/kanagawa.nvim',
  'nmac427/guess-indent.nvim',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
        pcall(vim.api.nvim_command, 'MasonUpdate')
        end
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
  }
}
