local fn = vim.fn

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      local util = require("conform.util")

      -- Helper function to check if we're in an Angular project
      local function is_angular_project()
        return util.root_file({ "angular.json" })
      end

      -- Configure TypeScript/JavaScript related filetypes
      local js_filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "json",
        "jsonc",
      }

      -- Apply the conditional formatting to all JS/TS filetypes
      for _, ft in ipairs(js_filetypes) do
        opts.formatters_by_ft[ft] = { "deno_fmt", "prettier" }
      end
      -- opts.formatters_by_ft.htmlangular = { "prettier" }
      -- Configure HTML formatting to use prettier only for non-Angular projects
      opts.formatters_by_ft["html"] = function(bufnr)
        if is_angular_project() then
          return {} -- No formatter for Angular HTML files
        else
          return { "prettier" }
        end
      end

      -- Configure deno formatter
      opts.formatters = opts.formatters or {}

      opts.formatters.deno_fmt = {
        command = "deno",
        args = { "fmt", "-" },
        stdin = true,
        condition = util.root_file("deno.json"),
      }

      opts.formatters.prettier = {
        command = vim.fn.executable(vim.fn.getcwd() .. "/node_modules/.bin/prettier") == 1
            and (vim.fn.getcwd() .. "/node_modules/.bin/prettier")
          or "prettier",

        args = {
          "--stdin-filepath",
          "$FILENAME",
        },

        stdin = true,
        require_cwd = true,
      }
    end,
  },
}
