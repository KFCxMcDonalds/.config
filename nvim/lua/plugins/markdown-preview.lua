return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    lazy = true;
    init = function()
        vim.g.mkdp_markdown_css = '/Users/liwenwu/Files/Notes/.obsidian/img_center.css'
    end,
}
