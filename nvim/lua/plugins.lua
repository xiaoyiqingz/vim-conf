return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require("plugin-config.dashboard-nvim")
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    use {"akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup({
                shell = "/usr/local/bin/bash -l",
            })
        end,
        cond = false,   -- not load this plugin
    }

    use {
        "hudclark/grpc-nvim",
        requires = { "nvim-lua/plenary.nvim" }
    }

    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugin-config.rest-nvim")
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("plugin-config.nvim-tree")
        end
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("plugin-config.telescope")
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require("plugin-config.treesitter")
        end,
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    use {
        'stevearc/oil.nvim',
        config = function()
            require("plugin-config.oil")
        end,
    }

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("plugin-config.project")
        end
    }

end)
