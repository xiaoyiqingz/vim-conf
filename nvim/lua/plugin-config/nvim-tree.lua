--local status, nvim_tree = pcall(require, "nvim-tree")
--if not status then
--	vim.notify("没有找到 nvim-tree")
--	return
--end

require('nvim-tree').setup({
    -- 关闭文件时自动关闭
    auto_close = true,

    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },

    -- 打开nvim-tree 自动定位到当前文件
    update_focused_file = {
        enable = true,
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
