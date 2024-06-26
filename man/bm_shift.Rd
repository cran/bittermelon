% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bm_shift.R
\name{bm_shift}
\alias{bm_shift}
\alias{bm_shift.bm_bitmap}
\alias{bm_shift.bm_list}
\alias{bm_shift.bm_pixmap}
\alias{bm_shift.magick-image}
\alias{bm_shift.nativeRaster}
\alias{bm_shift.raster}
\title{Shift elements within bitmaps}
\usage{
bm_shift(x, value, top = NULL, right = NULL, bottom = NULL, left = NULL)

\method{bm_shift}{bm_bitmap}(x, value = 0L, top = NULL, right = NULL, bottom = NULL, left = NULL)

\method{bm_shift}{bm_list}(x, ...)

\method{bm_shift}{bm_pixmap}(
  x,
  value = col2hex("transparent"),
  top = NULL,
  right = NULL,
  bottom = NULL,
  left = NULL
)

\method{bm_shift}{`magick-image`}(
  x,
  value = "transparent",
  top = NULL,
  right = NULL,
  bottom = NULL,
  left = NULL
)

\method{bm_shift}{nativeRaster}(
  x,
  value = col2int("transparent"),
  top = NULL,
  right = NULL,
  bottom = NULL,
  left = NULL
)

\method{bm_shift}{raster}(
  x,
  value = "transparent",
  top = NULL,
  right = NULL,
  bottom = NULL,
  left = NULL
)
}
\arguments{
\item{x}{Either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{"magick-image"}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{"raster"}  object.}

\item{value}{Value for the new pixels.}

\item{top}{Number of pixels to shift towards the top side.}

\item{right}{Number of pixels to shift towards the right side.}

\item{bottom}{Number of pixels to shift towards the bottom side.}

\item{left}{Number of pixels to shift towards the left side.}

\item{...}{Additional arguments to be passed to or from methods.}
}
\value{
Depending on \code{x} either a \code{\link[=bm_bitmap]{bm_bitmap()}}, \code{\link[=bm_font]{bm_font()}}, \code{\link[=bm_list]{bm_list()}}, \link[magick:editing]{magick-image}, "nativeRaster", \code{\link[=bm_pixmap]{bm_pixmap()}}, or \link[grDevices:as.raster]{raster}  object.
}
\description{
Shifts non-padding elements within bitmaps by trimming on a specified side and padding on the other
while preserving the width and height of the original bitmap.
}
\details{
This function is a convenience wrapper around \code{\link[=bm_trim]{bm_trim()}} and \code{\link[=bm_extend]{bm_extend()}}.
}
\examples{
font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon")
font <- read_hex(font_file)
capital_r <- font[[str2ucp("R")]]
print(capital_r)
capital_r <- bm_shift(capital_r, bottom = 2L, right = 1L)
print(capital_r)
corn <- farming_crops_16x16()$corn$portrait
print(bm_padding_lengths(corn))
corn_shifted <- bm_shift(corn, left = 1L, top = 2L)
if (cli::is_utf8_output() && cli::num_ansi_colors() >= 256L) {
  print(corn_shifted, bg = "cyan", compress = "v")
}
}
\seealso{
\code{\link[=bm_trim]{bm_trim()}} and \code{\link[=bm_extend]{bm_extend()}}
}
