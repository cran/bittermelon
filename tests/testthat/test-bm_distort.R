test_that("`bm_distort()` works", {
    skip_if_not(cli::is_utf8_output())
    skip_if_not_installed("farver")
    skip_if_not_installed("magick")
    skip_if_not_installed("withr")
    withr::local_options(bm_options(default = TRUE))

    corn <- farming_crops_16x16()$corn$portrait
    corn_l <- bm_list(as_bm_bitmap(corn))
    corn_r <- as.raster(corn)
    corn_nr <- as.raster(corn, native = TRUE)
    corn_mi <- magick::image_read(corn)

    corn_ds <- bm_downscale(corn, width = 32L)
    expect_equal(corn, corn_ds)

    corn_d <- bm_distort(corn, height = 16L, width = 32L)
    corn_ld <- bm_distort(corn_l, height = 16L, width = 32L)
    corn_rd <- bm_distort(corn_r, height = 16L, width = 32L)
    corn_nrd <- bm_distort(corn_nr, height = 16L, width = 32L)
    corn_mid <- bm_distort(corn_mi, height = 16L, width = 32L)

    expect_equal(bm_heights(corn_d), 16L)
    expect_equal(bm_heights(corn_ld), 16L)
    expect_equal(bm_heights(corn_rd), 16L)
    expect_equal(bm_heights(corn_nrd), 16L)
    expect_equal(bm_heights(corn_mid), 16L)
    expect_equal(bm_widths(corn_d), 32L)
    expect_equal(bm_widths(corn_ld), 32L)
    expect_equal(bm_widths(corn_rd), 32L)
    expect_equal(bm_widths(corn_nrd), 32L)
    expect_equal(bm_widths(corn_mid), 32L)

    corn_d2 <- bm_distort(corn, width = 12L)
    corn_ds2 <- bm_downscale(corn, width = 12L)
    corn_ld2 <- bm_distort(corn_l, width = 12L)
    corn_rd2 <- bm_distort(corn_r, width = 12L)
    corn_nrd2 <- bm_distort(corn_nr, width = 12L)
    corn_mid2 <- bm_distort(corn_mi, width = 12L)
    expect_equal(corn_d2, corn_ds2)
    expect_equal(bm_heights(corn_d2), 12L)
    expect_equal(bm_heights(corn_ld2), 12L)
    expect_equal(bm_heights(corn_rd2), 12L)
    expect_equal(bm_heights(corn_nrd2), 12L)
    expect_equal(bm_heights(corn_mid2), 12L)
    expect_equal(bm_widths(corn_d2), 12L)
    expect_equal(bm_widths(corn_ld2), 12L)
    expect_equal(bm_widths(corn_rd2), 12L)
    expect_equal(bm_widths(corn_nrd2), 12L)
    expect_equal(bm_widths(corn_mid2), 12L)

    corn_d3 <- bm_compress(corn, "v")
    corn_ld3 <- bm_compress(corn_l, "h")
    corn_rd3 <- bm_compress(corn_r, "b")
    corn_nrd3 <- bm_compress(corn_nr, "v")
    corn_mid3 <- bm_compress(corn_mi, "h")
    expect_equal(bm_heights(corn_d3), 8L)
    expect_equal(bm_heights(corn_ld3), 16L)
    expect_equal(bm_heights(corn_rd3), 8L)
    expect_equal(bm_heights(corn_nrd3), 8L)
    expect_equal(bm_heights(corn_mid3), 16L)
    expect_equal(bm_widths(corn_d3), 16L)
    expect_equal(bm_widths(corn_ld3), 8L)
    expect_equal(bm_widths(corn_rd3), 8L)
    expect_equal(bm_widths(corn_nrd3), 16L)
    expect_equal(bm_widths(corn_mid3), 8L)

    verify_output("txt/bm_distort.txt", {
        print(corn_d, compress = "v", downscale = TRUE)
        print(corn_ld)
        bm_print(corn_rd, compress = "v")
        bm_print(corn_nrd, compress = "v")
        bm_print(corn_mid, compress = "v")
    }, unicode = TRUE, crayon = FALSE)

    font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon")
    font <- read_hex(font_file)
    capital_r <- font[[str2ucp("R")]]
    verify_output("txt/capital_r_distorted.txt",
                  print(bm_distort(capital_r, width = 9L, height = 21L), px = px_ascii))
})
