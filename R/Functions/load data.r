load_wide_map_data <- function() {
  d <- load_all_map_from_raw()
  d.w <- make_wide_map_data(d)
  return(d.w)
}

load_all_map_from_raw <- function() {
  filenames <- list.files("./../Data/Raw", pattern=".csv", full.names=TRUE)
  ldf <- lapply(filenames, read.csv, head=TRUE, na.string=c(""), stringsAsFactors=F)
  res <- lapply(ldf, extract_map_fields)
  d <- rbind.fill(res)
  return(d)
}
