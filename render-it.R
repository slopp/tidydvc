options(repos = c(CRAN = 'https://packagemanager.rstudio.com/cran/__linux__/ubuntu/latest'))
renv::restore()
rmarkdown::render("fit_model.Rmd")