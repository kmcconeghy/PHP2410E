render_hw <- function (code_name, code_path, coder, report_path, stamp = T) {
  
  lst_files <- list.files(code_path, pattern = ".Rmd", full.names = T)
  
  f_path <- lst_files[str_detect(lst_files, code_name)]
  f_name <- list.files(code_path, pattern = ".Rmd")[str_detect(list.files(code_path, 
                                                                        pattern = ".Rmd"), code_name)]
  if (stamp) {
    report_path <- paste0(report_path, code_name, ".", coder, ".", Scotty::timestamp(), ".pdf")
  }
  else {
    report_path <- paste0(report_path, f_name, ".pdf")
  }
  rmarkdown::render(input = f_path, 
                    output_file = report_path, 
                    envir = new.env())
}