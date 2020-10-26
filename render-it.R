options(repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))
install.packages('renv')
renv::restore()
rmarkdown::render("fit_model.Rmd")