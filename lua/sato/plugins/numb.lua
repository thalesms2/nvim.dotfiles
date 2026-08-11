-- Better peek lines on the buffer
return {
  'nacro90/numb.nvim',
  enabled = true,
  config = function()
    require('numb').setup({
        centered_peeking = true,
        show_cursorline = true,
    })
  end,
}
