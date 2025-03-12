return {
  -- GraphQL syntax highlighting and language support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "graphql" })
      end
    end,
  },

  -- Optional: Add dedicated GraphQL plugin for additional features
  {
    "jparise/vim-graphql",
    ft = { "graphql", "gql" },
    lazy = true,
  },

  -- GraphQL LSP support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {
          filetypes = { "graphql", "gql" },
          root_dir = require("lspconfig").util.root_pattern(".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
        },
      },
    },
  },
}
