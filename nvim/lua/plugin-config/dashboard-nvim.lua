local status, dashboardnvim = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard-nvim")
    return
end

-- 以下为自定义配置
dashboardnvim.setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
    },
})
