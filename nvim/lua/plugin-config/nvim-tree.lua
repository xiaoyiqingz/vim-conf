--local status, nvim_tree = pcall(require, "nvim-tree")
--if not status then
--	vim.notify("没有找到 nvim-tree")
--	return
--end

require('nvim-tree').setup({
    hijack_netrw = true,
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },

    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    -- 打开nvim-tree 自动定位到当前文件
    update_focused_file = {
        enable = true,
        update_root = true
    },
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function(data)
      -- buffer is a real file on the disk
      local real_file = vim.fn.filereadable(data.file) == 1

      -- buffer is a [No Name]
      local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

      if not real_file and not no_name then
        return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
