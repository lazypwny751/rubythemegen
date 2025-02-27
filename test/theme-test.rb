require "grubthemegen"

theme = GrubTheme.new()

theme.title_text = "Lazy Grub"
theme.title_font = "Ubuntu Regular"
theme.title_color = "#ffffff"
theme.message_color = "#000000"
theme.message_bg_color = "#000000"
theme.desktop_color = "#2857a8"
theme.terminal_font = "Ubuntu Regular"

components = [
	theme.label(text: %x(printf "%s" $(grub-install --version)), id: "__coolthing__"),
	theme.image(file: "deneme.png"),
	theme.label(), # Null label (it won't be processed).
	theme.image(file: "merhaba.png", id: "merhaba")
]

theme.push("# direct write to component buffer.\n") # I don't recommend to use this directly but you can.
theme.push(*components)
theme.push(theme.label(text: "very very cool grub 😎"))
theme.label(text: "not included.") # This component will not be included.

theme.push(
	theme.vbox(
		theme.label(text: "this is vertical box label."),
		theme.image(file: "merhaba.png")
))

theme_txt = theme.gen

puts(theme_txt)
