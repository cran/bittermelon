% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bm_distort.R
\name{bm_distort}
\alias{bm_distort}
\alias{bm_downscale}
\alias{bm_distort.bm_bitmap}
\alias{bm_distort.bm_list}
\alias{bm_distort.bm_pixmap}
\alias{bm_distort.magick-image}
\alias{bm_distort.nativeRaster}
\alias{bm_distort.raster}
\title{Resize bitmaps via distortion.}
\usage{
bm_distort(x, width = NULL, height = NULL, ...)

bm_downscale(x, width = getOption("width"), ...)

\method{bm_distort}{bm_bitmap}(
  x,
  width = NULL,
  height = NULL,
  ...,
  filter = "Point",
  threshold = 0.5
)

\method{bm_distort}{bm_list}(x, ...)

\method{bm_distort}{bm_pixmap}(x, width = NULL, height = NULL, ..., filter = "Point")

\method{bm_distort}{`magick-image`}(x, width = NULL, height = NULL, ..., filter = "Point")

\method{bm_distort}{nativeRaster}(x, width = NULL, height = NULL, ..., filter = "Point")

\method{bm_distort}{raster}(x, width = NULL, height = NULL, ..., filter = "Point")
}
\arguments{
\item{x}{Either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{"magick-image"}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{"raster"}  object.}

\item{width}{Desired width of bitmap}

\item{height}{Desired height of bitmap}

\item{...}{Additional arguments to be passed to or from methods.}

\item{filter}{Passed to \code{\link[magick:transform]{magick::image_resize()}}.
Use \code{\link[magick:options]{magick::filter_types()}} for list of supported filters.
The default "Point" filter will maintain your sprite's color palette.
\code{NULL} will give you the \code{magick}'s default filter which may work better
if you are not trying to maintain a sprite color palette.}

\item{threshold}{When the alpha channel
weakly exceeds this threshold
(on an interval from zero to one)
then the pixel is determined to be \dQuote{black}.}
}
\value{
Depending on \code{x} either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{magick-image}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{raster}  object.
}
\description{
\code{bm_distort()} resize bitmaps to arbitrary width and height value via \code{\link[magick:transform]{magick::image_resize()}}.
\code{bm_downscale()} is a wrapper to \code{bm_distort()} that downscales an image if (and only if) it is
wider than a target width.
}
\examples{
font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon")
font <- read_hex(font_file)
capital_r <- font[[str2ucp("R")]]
dim(capital_r) # 8 x 16
if (requireNamespace("magick", quietly = TRUE)) {
  capital_r_9x21 <- bm_distort(capital_r, width = 9L, height = 21L)
  print(capital_r_9x21)
}
crops <- farming_crops_16x16()
corn <- crops$corn$portrait
dim(corn) # 16 x 16
if (cli::is_utf8_output() && 
    cli::num_ansi_colors() >= 256L &&
    requireNamespace("magick", quietly = TRUE)) {
  corn_24x24 <- bm_distort(corn, width = 24L)
  print(corn_24x24, compress = "v")
}
}
\seealso{
\code{\link[=bm_expand]{bm_expand()}} for expanding width/height by integer multiples.
\code{\link[=bm_resize]{bm_resize()}} for resizing an image via trimming/extending an image.
}
