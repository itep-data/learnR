create_rmd <- function(file, child_folder, theme, add_colors = TRUE) {

  recipe <- read.csv(file, stringsAsFactors = FALSE)

  out <- ""

  for(md_file in unique(recipe$output_file)) {

    temp <- subset(recipe, output_file == md_file)

    if(add_color) {
      out <- paste0(out, "<div style = \"margin-left: -14px; padding-left: 14px; border-left: solid 8px ", temp$color[1], ";\">")
    }

    for(i in 1:nrow(temp)) {

      out <- paste0(out, "\n ", temp[i, "before"], "\n")

      new_path <- paste(child_folder, temp[i, "md_folder"], paste0(theme, ".Rmd"), sep = "/")

      if(!is.na(temp[i, "md_folder"])) {
        new_chunk <- add_md(new_path)
        out <- paste0(out, new_chunk)
      }

      out <- paste0(out, temp[i, "after"], "\n")

    }

    if(add_color) out <- paste0(out, '</div>')

    writeLines(out, paste0(gsub("[.Rmd]", "", md_file), ".Rmd"))

  }

}
