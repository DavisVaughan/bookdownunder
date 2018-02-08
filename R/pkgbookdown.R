use_pkgbookdown <- function(path) {
  bookdown:::bookdown_skeleton(path)
}

render_pkgbookdown <- function(path) {
  withr::with_dir(path, {bookdown::render_book(".")})
}

copy_book_to_vignettes <- function(path) {

  if(fs::dir_exists("vignettes/book")) {
    fs::dir_delete("vignettes/book")
  }

  # Rename to be book not _book so github pages doesn't ignore it
  fs::dir_copy(paste0(path, "/_book"), new_path = "vignettes/book")
}

# use_pkgbookdown("book")
# render_pkgbookdown("book")
# copy_book_to_vignettes("book")
