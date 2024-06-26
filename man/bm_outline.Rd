% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bm_outline.R
\name{bm_outline}
\alias{bm_outline}
\alias{bm_outline.bm_bitmap}
\alias{bm_outline.bm_list}
\alias{bm_outline.bm_pixmap}
\alias{bm_outline.magick-image}
\alias{bm_outline.nativeRaster}
\alias{bm_outline.raster}
\title{Compute "outline" bitmap of a bitmap}
\usage{
bm_outline(x, value, bg)

\method{bm_outline}{bm_bitmap}(x, value = 1L, bg = 0L)

\method{bm_outline}{bm_list}(x, ...)

\method{bm_outline}{bm_pixmap}(x, value = col2hex("black"), bg = col2hex("transparent"))

\method{bm_outline}{`magick-image`}(x, value = "black", bg = "transparent")

\method{bm_outline}{nativeRaster}(x, value = col2int("black"), bg = col2int("transparent"))

\method{bm_outline}{raster}(x, value = "black", bg = "transparent")
}
\arguments{
\item{x}{Either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{"magick-image"}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{"raster"}  object.}

\item{value}{Bitmap \dQuote{color} value for the outline.}

\item{bg}{Bitmap \dQuote{background} value.}

\item{...}{Additional arguments to be passed to or from methods.}
}
\value{
Depending on \code{x} either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{magick-image}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{raster}  object.
}
\description{
\code{bm_outline()} returns a bitmap that is just the \dQuote{outline}
of another bitmap.
}
\examples{
square <- bm_bitmap(matrix(1L, nrow = 16L, ncol = 16L))
square_outline <- bm_outline(square)
print(square_outline)

if (require(grid) && capabilities("png")) {
  circle <- as_bm_bitmap(circleGrob(), width=16, height=16)
  circle_outline <- bm_outline(circle)
  print(circle_outline)
}

corn <- farming_crops_16x16()$corn$portrait
corn_outline <- bm_outline(corn, "magenta")
if (cli::is_utf8_output() && cli::num_ansi_colors() >= 256L) {
  print(corn_outline, bg = "white")
}
}
