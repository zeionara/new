require('lspconfig').pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        flake8 = { enabled = true },
        pyflakes = { enabled = true },
        pydocstyle = { enabled = false },
        black = { enabled = true },
        autopep8 = { enabled = true },
        pycodestyle = {
          ignore = { 'E251', 'W504' },
          maxLineLength = 200
        }
      }
    }
  }
}
