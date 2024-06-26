% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print.bm_pixmap.R
\name{print.bm_pixmap}
\alias{print.bm_pixmap}
\alias{format.bm_pixmap}
\title{Print pixmap objects}
\usage{
\method{print}{bm_pixmap}(
  x,
  ...,
  bg = getOption("bittermelon.bg", FALSE),
  compress = getOption("bittermelon.compress", "none"),
  downscale = getOption("bittermelon.downscale", FALSE)
)

\method{format}{bm_pixmap}(
  x,
  ...,
  bg = getOption("bittermelon.bg", FALSE),
  compress = getOption("bittermelon.compress", "none"),
  downscale = getOption("bittermelon.downscale", FALSE)
)
}
\arguments{
\item{x}{A \code{\link[=bm_pixmap]{bm_pixmap()}} object}

\item{...}{Currently ignored.}

\item{bg}{R color string of background color to use and/or
cli ANSI style function of class \code{cli_ansi_style}.
\code{FALSE} (default) for no background color
(i.e. use default terminal background).}

\item{compress}{How to print the image:
* "none" (default) or "n" use one character per pixel.
* "vertical" or "v" use one character per two vertical pixels
(makes pixels look closest to square in typical terminal).
* "horizontal" or "h" use one character per two horizontal pixels.
* "both" or "b" use one character per four pixels
(this will be a lossy conversion whenever there are more than two colors per four pixels).}

\item{downscale}{If \code{TRUE} and the printed pixmap will be wider than \code{getOption("width")}
then shrink the image to fit \code{getOption("width")} using \code{\link[=bm_downscale]{bm_downscale()}}.}
}
\value{
A character vector of the string representation (\code{print.bm_pixmap()} does this invisibly).
As a side effect \code{print.bm_pixmap()} prints out the string representation to the terminal.
}
\description{
\code{print.bm_pixmap()} prints bittermelon pixmap objects to the terminal
It is a wrapper around \code{format.bm_pixmap()}.
}
\section{Fonts and terminal settings}{
Printing bitmaps/pixmaps may or may not look great
in your terminal depending on a variety of factors:
\itemize{
\item The terminal should support the Unicode - UTF-8 encoding.
We use \code{\link[cli:is_utf8_output]{cli::is_utf8_output()}} to guess Unicode support
which in turn looks at \code{getOption("cli.unicode")} and \code{\link[=l10n_info]{l10n_info()}}.
\item The terminal should support ANSI sequences and if it does
it should support many colors.
\itemize{
\item We use \code{\link[cli:num_ansi_colors]{cli::num_ansi_colors()}} to detect number of colors supported.
\code{num_ansi_colors()} detection algorithm is complicated but it first looks at
\code{getOption("cli.num_colors")}.
}
\itemize{
\item If \code{cli::num_ansi_colors()} equals 16777216 then your terminal
supports 24-bit ANSI colors.
}
\itemize{
\item If using the Windows Command Prompt window you may need to enable
ANSI sequences support by doing \verb{REG ADD HKCU\\CONSOLE /f /v VirtualTerminalLevel /t REG_DWORD /d 1}
from the command-line or running \code{regedit} (Registry Editor) and go to
\verb{Computer\\HKEY_CURRENT_USER\\Console} and set \code{VirtualTerminalLevel} to \code{1}.
}
\item The font used by the terminal should be a monoscale font that supports the
\href{https://en.wikipedia.org/wiki/Block_Elements}{Block Elements} Unicode block.
\item The terminal text settings should have a cell spacing around 1.00 times width and 1.00 times height.
For terminals configured by CSS styles this means a \code{line-height} of around \code{1.0}.
}
}

\examples{
crops <- farming_crops_16x16()
corn <- crops$corn$portrait
if (cli::is_utf8_output() && cli::num_ansi_colors() >= 256L) {
  print(corn)
}

if (cli::is_utf8_output() && cli::num_ansi_colors() >= 256L) {
  print(corn, compress = "v", bg = cli::bg_br_white)
}

if (cli::is_utf8_output() && 
    cli::num_ansi_colors() > 256L &&
    getOption("width") >= 100L) {
  img <- png::readPNG(system.file("img", "Rlogo.png", package="png"))
  pm <- as_bm_pixmap(img)
  print(pm, compress = "v")
}
}
