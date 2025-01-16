## ----hidden, echo = FALSE-----------------------------------------------------
knitr::opts_chunk$set(fig.cap = '', comment = '', class.output = "bitmap")

## ----print--------------------------------------------------------------------
library("bittermelon") # remotes::install_github("trevorld/bittermelon")
font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon")
font <- read_hex(font_file)
bml <- as_bm_list("RSTATS", font = font)
# With vertical compression
bm <- bml |> bm_call(cbind) |> bm_compress("vertical")
print(bm)
# Upside down with ASCII characters
bm <- bml |>
    bm_flip("both") |>
    bm_call(cbind, direction = "RTL")
print(bm, px = px_ascii)
# With a shadow effect and borders
bm <- bml |>
    bm_pad(sides = 2L) |>
    bm_shadow() |>
    bm_extend(sides = c(2L, 1L), value = 3L) |>
    bm_call(cbind) |>
    bm_pad(sides = 2L, value = 3L)
print(bm)

## ----print_color, eval=FALSE--------------------------------------------------
# if (cli::num_ansi_colors() >= 16L)
#     print(bm, px = " ",
#           bg = c(cli::bg_br_white, cli::bg_blue, cli::bg_cyan, cli::bg_red))

## ----plot, fig.width = 6, fig.height = 2, fig.alt = "Stylized bitmap image that says 'RSTATS`."----
plot(bm, col = c("white", "blue3", "cyan3", "red3"))

## ----gridpattern, eval=requireNamespace("gridpattern")------------------------
# Also supports {gridpattern} matrices
gridpattern::pattern_weave("twill_herringbone", nrow=14L, ncol = 50L) |>
    as_bm_bitmap() |>
    print(compress = "vertical")

## ----plot_gridpattern, fig.width = 6, fig.height = 1.5, fig.alt = "Rainbow squares", eval=requireNamespace("gridpattern")----
gridpattern::pattern_square(subtype=8L, nrow=8L, ncol = 50L) |>
    as_bm_pixmap(s, col = grDevices::rainbow(8L)) |>
    plot()

## ----maze, eval=requireNamespace("mazing")------------------------------------
# Also supports {mazing} mazes
set.seed(42)
m <- mazing::maze(16L, 32L)
m |> as_bm_bitmap(walls = TRUE) |>
    print(compress = "vertical")

## ----plot_maze, fig.width = 6, fig.height = 3, fig.alt = "A maze", eval=requireNamespace("mazing")----
# Can also visualize the maze solutions
pal <- grDevices::palette.colors()
m |> as_bm_pixmap(start = "top", end = "bottom",
                  col = c(pal[6L], "white", pal[7L], pal[5L])) |>
   bm_pad(sides = 1L) |>
   plot()

## ----farming_crops------------------------------------------------------------
# Contains some built-in farming crops sprites
crops <- farming_crops_16x16()
names(crops)
corn <- crops$corn$portrait
grapes <- crops$grapes$portrait
orange <- crops$orange$stage5
tulip <- crops$tulip$portrait
pm <- cbind(corn, grapes, orange, tulip)

## ----print_crops, eval=FALSE--------------------------------------------------
# if (cli::is_utf8_output() && cli::num_ansi_colors() >= 256L)
#     print(pm, compress = "v", bg = "white")

## ----plot_sprites, fig.width = 6, fig.height = 1.5, fig.alt = "Sprites of some food crops"----
plot(pm)

## ----builtin------------------------------------------------------------------
spleen_8x16 <- read_hex(system.file("fonts/spleen/spleen-8x16.hex.gz",
                                    package = "bittermelon"))
fixed_4x6 <- read_yaff(system.file("fonts/fixed/4x6.yaff.gz",
                                   package = "bittermelon"))
fixed_5x8 <- read_yaff(system.file("fonts/fixed/5x8.yaff.gz",
                                   package = "bittermelon"))
fixed_6x13 <- read_yaff(system.file("fonts/fixed/6x13.yaff.gz",
                                    package = "bittermelon"))
as_bm_bitmap("RSTATS", font = spleen_8x16) |> bm_compress("v")
as_bm_bitmap("RSTATS", font = fixed_4x6) |> bm_compress("v")
as_bm_bitmap("RSTATS", font = fixed_5x8) |> bm_compress("v")
as_bm_bitmap("RSTATS", font = fixed_6x13) |> bm_compress("v")

## ----unifont, eval=requireNamespace("hexfont") && file.exists(hexfont:::unifont_cache_filename())----
library("hexfont")
system.time(font <- unifont()) # Unifont is a **big** font
length(font) |> prettyNum(big.mark = ",") # number of glyphs
object.size(font) |> format(units = "MB") # memory used

# Faster to load from a cache
system.time(font <- unifont(cache = TRUE))

# Or just load the subset of GNU Unifont you need
s <- "Ｒ很棒！"
system.time(font_s <- unifont(ucp = str2ucp(s)))

# Mandarin Chinese
as_bm_bitmap(s, font = font_s) |> bm_compress("v")

# Emoji
as_bm_bitmap("🐭🐲🐵", font = font) |> bm_compress("v")

# Klingon
as_bm_list("", font = font) |>
    bm_pad(type = "trim", left = 1L, right = 1L) |>
    bm_call(cbind) |>
    bm_compress("v")

