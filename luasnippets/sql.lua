local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("sql", {

    s("option table", {
        t("CREATE TABLE IF NOT EXISTS "), i(1, "schema"), t(".opt_"), i(2, "table_name"), t({ " (",
        "\tid SERIAL PRIMARY KEY,",
        "\tname VARCHAR(255) NOT NULL,",
        "\tcreated_at TIMESTAMP DEFAULT NOW(),",
        "\tupdated_at TIMESTAMP DEFAULT NOW(),",
        "\tdeleted_at TIMESTAMP",
        ")" }),
    }),

    s("create table", {
        sn(1, {
            t("CREATE TABLE IF NOT EXISTS"), i(1, "schema"), t(".tab_"), i(2, "table_name"), t({ " (",
            "\tid SERIAL PRIMARY KEY,", "" }),
            i(3, "columns", ""),
            t({ "\tcreated_at TIMESTAMP DEFAULT NOW(),",
                "\tupdated_at TIMESTAMP DEFAULT NOW(),",
                "\tdeleted_at TIMESTAMP",
                ")" }),
        }),
    }),

    s("rlt table", {
        sn(1, {
            t("CREATE TABLE IF NOT EXISTS"), i(1, "schema"), t(".rlt_"), i(2, "table1"), t("_"), i(3, "table2"), t({ " (",
            "\tid SERIAL PRIMARY KEY,", "" }),
            f(function(args)
                return {
                    "\t" ..
                    args[1][1] ..
                    "." ..
                    args[2][1] ..
                    "_id NOT NULL INTEGER REFERENCES " ..
                    args[1][1] .. "." .. args[2][1] .. "(id) ON UPDATE CASCADE ON DELETE CASCADE,",
                    "\t" ..
                    args[1][1] ..
                    "." ..
                    args[3][1] ..
                    "_id NOT NULL INTEGER REFERENCES " ..
                    args[1][1] .. "." .. args[3][1] .. "(id) ON UPDATE CASCADE ON DELETE CASCADE,",
                    ""
                }
            end, { 1, 2, 3 }
            ),
            t({ "\tcreated_at TIMESTAMP DEFAULT NOW(),",
                "\tupdated_at TIMESTAMP DEFAULT NOW(),",
                "\tdeleted_at TIMESTAMP", ")",
            }),
        }),
    }),

    s("add column", {
        t("ALTER TABLE "), i(1, "table_name", ""),
        t("ADD COLUMN "), i(2, "column_name"), i(3, "column_type"),
    }),
})
