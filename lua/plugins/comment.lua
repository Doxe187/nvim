return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      -- Treesitter-Integration für besseres Context-Commenting
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}
