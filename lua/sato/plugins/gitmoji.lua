return {
  dir = "~/gh/okinawa_higashi/",
  name = "snacks-gitmoji",
  keys = {
    { "<leader>gm", mode = "n", function() require("snacks-gitmoji").gitmoji() end, { desc = "[G]it[M]oji" } },
  },
}
