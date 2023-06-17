local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

-- 以下为自定义配置
telescope.setup({
    pickers = {
        git_files = {
            show_untracked = true,
        },
    },
})


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

require('telescope').load_extension('fzf')
