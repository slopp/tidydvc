options(repos = c(CRAN = 'https://packagemanager.rstudio.com/cran/__linux__/ubuntu/latest'))
install.packages('renv')
renv::restore()
rmarkdown::render("fit_model.Rmd")