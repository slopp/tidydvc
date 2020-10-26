## Tidymodels + DVC

This repository contains an example project showcasing how to use [DVC](https://dvc.org) alongside of [tidymodels](https://tidymodels.org). 

Full commentary is available here: https://loppsided.blog/posts/2020-10-26-tidymodels-dvc-mashup/

There are a couple of core ideas:

1. R Markdown is used as the main driver of model fitting and analysis. As such, the DVC "pipeline" consists of a single step, `render::rmarkdown`. 

2. Within the R Markdown document, some parts of the tidymodel's workflow are controlled automatically using `tune`, but other hyper parameters are set explicitly using DVC parameters.

3. DVC tracks the parameters, the experiment outputs (metrics), and the input data (in this case a simple csv file).

4. GitHub actions, along with [CML](https://cml.dev), is used to fit new models and create metric rich PRs. The flow is: update params or the RMD and open PR, GA runs the DVC pipeline to fit models and create and commit the output, summary metrics are presented in a PR comment.

To view an example, take a look at the PRs on the repo.

A few things that could be improved or made more realistic:  

- We don't do anything with the model. The model could be saved as RDS object and pushed somewhere with DVC.  
- The report HTML could be published to a more visible location. 
- The `renv` plumbing is a bit awkward, see `render-it.R` for the wrapper. Yay for Package Manager binaries(!) but there is still a bit of manual troubleshooting to get the appropriate system requirements in place. Perhaps we could use the Package Manager system requirements API. It'd be nice if `https://github.com/r-lib/actions` has an action designed for running R code not testing R packages.  
- The actual modeling exercise is a bit weak. I couldn't get the `stacks` package to work and, of course, the model itself is a bit sketchy; esp the pre-processing recipe!