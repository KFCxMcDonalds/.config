-- doc: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
-- add lua snips
    -- chinese doc: https://zjp-cn.github.io/neovim0.6-blogs/nvim/luasnip/doc1.html
-- examples: https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
return {
    "L3MON4D3/LuaSnip",
    opts = function ()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node

        local function generate_params(_, snip)
            local count = tonumber(snip.captures[1])
            local nodes = {}
            for j = 1, count do
                table.insert(nodes, t(":param "))
                table.insert(nodes, i(2*j, "param" .. j))
                table.insert(nodes, t(": "))
                table.insert(nodes, i(2*j+1, "description" .. j))
                table.insert(nodes, t({"", ""}))
            end
            return nodes
        end

        -- python
        ls.add_snippets("python", {
            -- function docs
            -- s({
            --     trig = "fdoc{%d}",
            --     desc = "function docs: usage, param, return"
            -- }, {
            --     t('"""'), t({"", ""}), i(1, "Usage"), t({"", "", ""}),
            --     f(generate_params, {1}),
            --     t({"", ""}),
            --     f(":return "), i(2, "return_type"), t(": "), i(3, "return description"), t({"", '"""'}),
            -- }),
            --
            s({
                trig = "dq",
                desc = "double quote of docs"
            }, {
                t('"""'), t({"", ""}),
                i(1, "Usage"), t({"", ""}),
                t({"", ""}), i(0), 
                t('"""')   
            }),
            s({
                trig = "docparam",
                desc = "param doc"
            }, {
                t(":param "),
                i(1, "param name"), t(": "),
                i(2, "description"), t({"", ""}),
            }),
            s({
                trig = "docreturn",
                desc = "return doc"
            }, {
                t(":return "),
                i(1, "return name"), t(": "),
                i(2, "description"), t({"", ""}),
            }),
        })
        -- markdown
        ls.add_snippets("markdown", {
            -- image comment
            s({
                trig = "imgcomment",
                desc = "add comment above image",
            }, {
                t("<div style='text-align: center; font-size: 13px; color: grey'>"), i(1),
                t("</div>"), i(0),
            }),
            s({
                trig = "keytable",
                desc = "table of keybindings",
            }, {
                t({"| Key | Desc |", "| --- | --- |", ""}),
                t("|`"), i(1), t("`|"), i(2), t("|"), i(0),
            }),
            s({
                trig = "keyterm",
                desc = "term of keybindings table",
            }, {
                t("|`"), i(1), t("`|"), i(2), t("|"), i(0),
            }),
            -- font color
            s({
                trig = "redfontcolor",
                desc = "change fonts' color to red",
            }, {
                t("<font color='#E83636'>"), i(1), t("</font>"), i(0),
            }),
            s({
                trig = "bluefontcolor",
                desc = "change fonts' color to blue",
            }, {
                t("<font color='#002FA7'>"), i(1), t("</font>"), i(0),
            }),
            s({
                trig = "orangefontcolor",
                desc = "change fonts' color to orange",
            }, {
                t("<font color='#E85827'>"), i(1), t("</font>"), i(0),
            }),
            s({
                trig = "yellowfontcolor",
                desc = "change fonts' color to yellow",
            }, {
                t("<font color='#F7C45C'>"), i(1), t("</font>"), i(0),
            }),
            s({
                trig = "purplefontcolor",
                desc = "change fonts' color to purple",
            }, {
                t("<font color='#5F4BA0'>"), i(1), t("</font>"), i(0),
            }),
                trig = "greenfontcolor",
            s({
                desc = "change fonts' color to green",
            }, {
                t("<font color='#6DAD87'>"), i(1), t("</font>"), i(0),
            }),
            -- equation
            s({
                trig = "ineuqation",
                desc = "inline equation",
            }, {
                t("$"), i(1), t("$"), i(0),
            }),
            s({
                trig = "bleuqation",
                desc = "block equation",
            }, {
                t("$$"), i(1), t("$$"), i(0),
            }),

            -- table
            -- s("trig", c(1, {
            --     t("Ugh boring, a text node"),
            --     i(nil, "At least I can edit something now..."),
            --     f(function(args) return "Still only counts as text!!" end, {})
            -- }))

        })
    end
}
