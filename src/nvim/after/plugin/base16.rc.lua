local status, _ = pcall(vim.cmd, "colorscheme base16-tomorrow-night")

if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed

  return
end
