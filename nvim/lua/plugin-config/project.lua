local status, project = pcall(require, "project_nvim")
if not status then
    vim.notify("没有找到 project_nvim")
    return
end

-- 以下为自定义配置
project.setup({
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".DS_Store" },
})
