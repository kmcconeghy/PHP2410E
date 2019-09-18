#
# Title: File to set-up directories and work for assignments
# Programmer: Kevin W. McConeghy
# Date Created: 2019.09.09
#

#--System options
cat('Setting R system options....')
options(scipen=999)
options(max.print = 250)
cat('Done', '\n')
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_221')


#--Folders to be created (if not existing)
  prj.dirs <- c("data", "reports", "src")

#--Packages to be loaded
  prj.pkgs <- c("tidyverse", "Scotty")
  lapply(prj.pkgs, library, warn.conflicts=F, quietly=T, character.only=T)
  
#--Others
  #--Programming objects
  if (Sys.getenv('USERNAME')=='kmcconeg') {
    prj.root = 'C:\\Github\\PHP2410E'
  }  
  setwd(prj.root)
  prj.nm <- "PHP2410E"
  prj.coder <- "Kevin W. McConeghy"
  prj.hw <- 'McConeghyK'
  prj.StDate <- "2019.09.09"
  
#--Directories
  wd.master <- paste0(prj.root, '/')
  wd.code <- paste0(wd.master, "src/")
  wd.funcs <- paste0(wd.code, "funcs/")
  wd.data <- paste0(wd.master, "dta/")
  wd.report <- paste0(wd.master, "rpt/")
  
#--Source local functions
  prj.func <- list.files(path=paste0(wd.funcs), pattern = '.R', full.names = T, recurs = F, include.dirs = F)

#--Load local functions
  for (i in prj.func) {
    source(i)
  }
  