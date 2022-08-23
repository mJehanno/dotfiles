return require("packer").startup(function(use)
	-- tools
	use 'wbthomason/packer.nvim'
	use { "williamboman/mason.nvim" }

-- themes
	use 'luisiacc/gruvbox-baby'
	use 'kyazdani42/nvim-web-devicons'	
	use 'KabbAmine/yowish.vim'

	-- ui
use {
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
  end,
}
use 'folke/todo-comments.nvim'
use 'preservim/nerdtree'
	use 'ryanoasis/vim-devicons'
	use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}
	use 'wvffle/vimterm'
	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
use 'mhinz/vim-startify'
	
	-- languages 
	
	use 'fatih/vim-go'

	-- cmp
	use 'L3MON4D3/LuaSnip'
  use("hrsh7th/cmp-buffer")
 	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")

	-- lsp
	use 'neovim/nvim-lspconfig'
	use("onsails/lspkind-nvim")
	use 'williamboman/nvim-lsp-installer'


	use("nvim-treesitter/nvim-treesitter", {
        	run = ":TSUpdate"
    	})
 	use("romgrk/nvim-treesitter-context")
	
	use("sbdchd/neoformat")
	use 'sheerun/vim-polyglot'

	--File browsing
	use 'nvim-telescope/telescope-file-browser.nvim'

	--Telescope Requirements
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	
	--Telescope
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

end)
