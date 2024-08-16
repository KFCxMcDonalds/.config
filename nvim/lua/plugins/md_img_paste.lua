return {
    'img-paste-devs/img-paste.vim',
    lazy = true;
    keys = {{"<leader>p", "<cmd>call mdip#MarkdownClipboardImage()<CR>", desc = "markdown paste images form clipboard"}};
    init = function ()
        vim.g.mdip_imgdir = 'attachments'
    end

}
