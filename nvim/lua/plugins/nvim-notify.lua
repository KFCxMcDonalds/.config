return {
  "rcarriga/nvim-notify",
  opts = {
    -- 设置通知显示在右下角
    top_down = false,  -- false 表示从下往上堆叠
    stages = "fade",   -- 动画效果: fade, slide, fade_in_slide_out, static
    timeout = 3000,    -- 显示时长(毫秒)
    max_width = 50,    -- 最大宽度
    max_height = 10,   -- 最大高度
    background_colour = "#000000",
    render = "minimal", -- 渲染样式: default, minimal, simple, compact
    minimum_width = 30,
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    -- 设置为默认的通知处理器
    vim.notify = notify
  end,
}
