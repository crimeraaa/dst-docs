-- `GLOBAL` is a DST mod env specific thing, but it basically refers to `_G`.
GLOBAL = _G

-- Searchpath is `dst_gamescripts\?.lua` for syntax highlighting!
require("class")
require("modutil")
require("prefabs")

-- Load global strings table for syntax highlighting
require("strings")
