#
# Title: Master file to execute project
# Programmer: Kevin W. McConeghy
# Date Created: 2019.09.09
#

#--Clear
  rm(list = ls())
  #dev.off()
  #devAskNewPage(FALSE)
  #options(device.ask.default = F)
  #grDevices::devAskNewPage(ask=FALSE)
  
#--ProjectSetUp
  source('PHP2410E_setup.R')

#--TimeStamp
  stmp_time <- lubridate::ymd_hms(Sys.time())
  stmp_time <- paste0(".",year(stmp_time), ".", month(stmp_time), ".", 
                      day(stmp_time), ".", hour(stmp_time), minute(stmp_time))
  
#--file specs
  print(paste0("Programmer: ",prj.coder))
  print(paste0("Project: ",prj.nm))
  print(paste0("Project Start Date: ", prj.StDate))
  print(paste0("File Run Date: ", stmp_time))
  
  #--IF ONLY WANT ONE FILE TO RUN
  #-- Ex. B07('A01', wd.CodeFiles, wd.ReportFiles)
  render_hw('hw2', wd.code, prj.hw, wd.report)
  
  
  cat(paste0('Project Run: ', prj.RunTime %--% Sys.time()))
  
  #End project