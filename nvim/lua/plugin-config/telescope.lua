local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

telescope.load_extension('fzf')
-- telescope.load_extension('project')

-- 以下为自定义配置
telescope.setup({
    project_actions = require("telescope._extensions.project.actions"),
    pickers = {
        git_files = {
            show_untracked = true,
        },
    },
    defaults = {
        vimgrep_arguments = {
             'rg',
             '--color=never',
             '--no-heading',
             '--with-filename',
             '--line-number',
             '--column',

             '--smart-case',
             '--hidden' ,
             '--glob',
             '!{**/.git/*,**/node_modules/*,**/package-lock.json,**/tags}',
        }
    }

    --- for telescope-project
    --extensions = {
    --    project = {
    --        base_dirs = {
    --            {'~/work/lcmf'},
    --            {'~/work/pantheon'},
    --        },
    --        hidden_files = true, -- default: false
    --        theme = "dropdown",
    --        order_by = "asc",
    --        search_by = "title",
    --        sync_with_nvim_tree = true, -- default false
    --        -- default for on_project_selected = find project files
    --        on_project_selected = function(prompt_bufnr)
    --            -- Do anything you want in here. For example:
    --            project_actions.change_working_directory(prompt_bufnr, false)
    --            require("harpoon.ui").nav_file(1)
    --        end
    --    }
    --},
    --- for telescope-project
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-L>', builtin.oldfiles, {})
vim.keymap.set('n', '<C-P>', builtin.git_files, {})
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})

vim.api.nvim_create_user_command("ProjectFiles", function()
	local opts = {
		-- recurse_submodules = true,
		hidden = true,
		show_untracked = true,
	}

	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		builtin.find_files(opts)
	end
end, { nargs = 0 })

pcall(telescope.load_extension, "projects")
