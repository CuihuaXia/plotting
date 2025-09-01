# plotting

![badge][badge-r]

[badge-r]: https://img.shields.io/badge/r-%23276DC3.svg?style=flat&logo=r&logoColor=white

This is an R package for plotting using ggplot2 in R.

## Dependencies
Need to install and load the `ggplot2` R package first.
```R
# BiocManager::install("ggplot2")
library(ggplot2)
library(grid)
```

## Install and load the package
```R
# library(remotes)
remotes::install_github("CuihuaXia/plotting", force = TRUE)
## or use `devtools`
# library(devtools)
# devtools::install_github("CuihuaXia/plotting", force = TRUE)

library(plotting)
```

## Functions
+ `sep()`: Print out a separation line.

<img width="376" alt="image" src="https://github.com/CuihuaXia/plotting/assets/31227230/74c42560-e45c-47ac-9959-01a8149bc2bf">

+ `my_theme(scale = 1, base_size = 12)`: Use my theme for ggplot2 plotting. The `scale` parameter is for adjusting the entire scale. The `base_size` is for adjusting the basic font size.
+ `copy_to_clipboard`: Write a variable (character/data frame) to the clipboard.
