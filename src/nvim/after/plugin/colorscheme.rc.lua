local status, theme = pcall(require, "github-theme")
if not status then
	return
end

theme.setup({
	theme_style = "dark_default",
})
