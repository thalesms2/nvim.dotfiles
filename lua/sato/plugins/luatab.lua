return { 
  'alvarosevilla95/luatab.nvim',
  desc = "Tabline",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('luatab').setup()
  end
}
