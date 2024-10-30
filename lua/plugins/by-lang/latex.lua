return {
  "texpresso.vim",
  filetypes = { "*.tex" },
  cmd = { "TeXpresso" },
  after = function()
    require("texpresso").texpresso_path = nixCats("bin.texpresso")
  end,
}
