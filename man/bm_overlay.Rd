% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bm_overlay.R
\name{bm_overlay}
\alias{bm_overlay}
\alias{bm_overlay.bm_bitmap}
\alias{bm_overlay.bm_list}
\alias{bm_overlay.bm_pixmap}
\alias{bm_overlay.magick-image}
\alias{bm_overlay.nativeRaster}
\alias{bm_overlay.raster}
\title{Merge bitmaps by overlaying one over another}
\usage{
bm_overlay(
  x,
  over = NULL,
  under = NULL,
  hjust = "center-left",
  vjust = "center-top",
  ...
)

\method{bm_overlay}{bm_bitmap}(
  x,
  over = NULL,
  under = NULL,
  hjust = "center-left",
  vjust = "center-top",
  bg = 0L,
  ...
)

\method{bm_overlay}{bm_list}(x, ...)

\method{bm_overlay}{bm_pixmap}(
  x,
  over = NULL,
  under = NULL,
  hjust = "center-left",
  vjust = "center-top",
  bg = col2hex("transparent"),
  ...
)

\method{bm_overlay}{`magick-image`}(
  x,
  over = NULL,
  under = NULL,
  hjust = "center-left",
  vjust = "center-top",
  bg = "transparent",
  ...
)

\method{bm_overlay}{nativeRaster}(
  x,
  over = NULL,
  under = NULL,
  hjust = "center-left",
  vjust = "center-top",
  bg = col2int("transparent"),
  ...
)

\method{bm_overlay}{raster}(
  x,
  over = NULL,
  under = NULL,
  hjust = "center-left",
  vjust = "center-top",
  bg = "transparent",
  ...
)
}
\arguments{
\item{x}{Either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{"magick-image"}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{"raster"}  object.}

\item{over}{A bitmap/pixmap object to overlay
over the \code{x} bitmap(s).
Only one of \code{over} or \code{under} may be set.}

\item{under}{A bitmap/pixmap object which will be overlaid
by the \code{x} bitmap(s).
Only one of \code{over} or \code{under} may be set.}

\item{hjust}{One of "left", "center-left", "center-right", "right".
"center-left" and "center-right" will attempt to
place in "center" if possible but if not possible will bias
it one pixel left or right respectively.
"centre", "center", and "centre-left" are aliases for "center-left".
"centre-right" is an alias for "center-right".}

\item{vjust}{One of "bottom", "center-bottom", "center-top", "top".
"center-bottom" and "center-top" will attempt to
place in "center" if possible but if not possible will bias
it one pixel down or up respectively.
"centre", "center", and "centre-top" are aliases for "center-top".
"centre-bottom" is an alias for "center-bottom".}

\item{...}{Additional arguments to be passed to or from methods.}

\item{bg}{Bitmap background value.}
}
\value{
Depending on \code{x} either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{magick-image}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{raster}  object.
}
\description{
\code{bm_overlay()} merges bitmaps by overlaying a bitmap over another.
}
\details{
If necessary bitmaps will be extended by \code{bm_extend()} such that
they are the same size.  Then the non-zero pixels of the \dQuote{over}
bitmap will be inserted into the \dQuote{under} bitmap.
}
\examples{
font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon")
font <- read_hex(font_file)
grave <- font[[str2ucp("`")]]
a <- font[[str2ucp("a")]]
a_grave <- bm_overlay(a, over = grave)
print(a_grave)

# Can also instead specify the under glyph as a named argument
a_grave2 <- bm_overlay(grave, under = a)
print(a_grave2)

crops <- farming_crops_16x16()
corn <- bm_shift(crops$corn$portrait, right = 2L, top = 2L)
grapes <- bm_shift(crops$grapes$portrait, bottom = 1L)
grapes_and_corn <- bm_overlay(corn, grapes)
if (cli::is_utf8_output() && cli::num_ansi_colors() >= 256L) {
  print(grapes_and_corn, compress = "v")
}
}
