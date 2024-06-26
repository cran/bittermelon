% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/monobit.R
\name{read_monobit}
\alias{read_monobit}
\alias{write_monobit}
\title{Read and write bitmap font files using monobit}
\usage{
read_monobit(
  file,
  quietly = FALSE,
  monobit_path = getOption("bittermelon.monobit_path", "monobit-convert")
)

write_monobit(
  font,
  file,
  quietly = FALSE,
  monobit_path = getOption("bittermelon.monobit_path", "monobit-convert")
)
}
\arguments{
\item{file}{A character string of a filename.}

\item{quietly}{If \code{TRUE} suppress any standard output/error from \code{monobit-convert}.}

\item{monobit_path}{Path/name of \code{monobit-convert} to use.  Passed to \code{\link[base:Sys.which]{base::Sys.which()}}.}

\item{font}{A \code{\link[=bm_font]{bm_font()}} object.}
}
\value{
\code{read_monobit()} returns a \code{\link[=bm_font]{bm_font()}} object.  \code{write_monobit()} returns \code{NULL} invisibly and
as a side effect writes \code{file}.
}
\description{
\code{read_monobit()} reads in bitmap font file as a \code{\link[=bm_font]{bm_font()}} object while \code{write_monobit()}
writes a \code{\link[=bm_font]{bm_font()}} object as a bitmap font file.
It uses the file extension to determine the appropriate bitmap font format to use.
}
\details{
\itemize{
\item \code{read_monobit()} and \code{write_monobit()} require that the \code{monobit-convert} command is available on the system.
\item \code{read_monobit()} and \code{write_monobit()} uses \code{monobit-convert} to convert to/from
the yaff font format which this package can natively read/write from/to.
\item One may install \code{monobit-convert} using \verb{pip3 install monobit}.
\item For more information about \code{monobit} see \url{https://github.com/robhagemans/monobit}.
}
}
\examples{
\donttest{# May take more than 5 seconds on CRAN servers
if (Sys.which("monobit-convert") != "") {
  try({
    font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon")
    font <- read_monobit(font_file)
    capital_r <- font[[str2ucp("R")]]
    print(capital_r)

    filename <- tempfile(fileext = ".yaff")
    write_monobit(font, filename)
  })
}
}
}
\seealso{
\code{\link[=bm_font]{bm_font()}} for more information about bitmap font objects.
\code{\link[=read_hex]{read_hex()}}, \code{\link[=write_hex]{write_hex()}}, \code{\link[=read_yaff]{read_yaff()}}, \code{\link[=write_yaff]{write_yaff()}} for pure R bitmap font readers and writers.
}
