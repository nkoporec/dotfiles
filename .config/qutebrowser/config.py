config.load_autoconfig()

# Open new tabs in the background.
c.tabs.background = True

# Position of new tabs opened from another tab.
c.tabs.new_position.related = 'next'

# Padding (in pixels) around text for tabs.
c.tabs.padding = {'bottom': 2, 'left': 5, 'right': 5, 'top': 2}

# Position of the tab bar.
c.tabs.position = 'top'

# Alignment of the text inside of tabs.
c.tabs.title.alignment = 'center'

# Width of tab indicators.
c.tabs.indicator.width = 3

# Padding (in pixels) for tab indicators.
c.tabs.indicator.padding = {'bottom': 0, 'left': 0, 'right': 5, 'top': 0}

# Height (in pixels or as percentage of the window) of the completion.
c.completion.height = '30%'

# Padding (in pixels) for the statusbar.
c.statusbar.padding = {'bottom': 2, 'left': 5, 'right': 5, 'top': 2}

# Widgets in statusbar
c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]

# Position of the status bar.
c.statusbar.position = 'bottom'

# Font used in the completion widget.
c.fonts.completion.entry = '8pt monospace'

# CSS border value for hints.
c.hints.border = '2px solid black'

# Font color for hints.
c.colors.hints.fg = 'white'

# Background color for hints.
c.colors.hints.bg = 'black'

# Font color for the matched part of hints.
c.colors.hints.match.fg = 'lime'

# keybindings for normal mode
config.bind('qq', 'quit')
config.bind('<Meta-R>', 'reload')
config.bind('L', 'forward')
config.bind('H', 'back')
config.bind('l', 'tab-next')
config.bind('h', 'tab-prev')
