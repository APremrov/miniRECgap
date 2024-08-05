
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PACKAGE: ‘miniRECgap’

<!-- badges: start -->
<!-- badges: end -->

‘miniRECgap’ is a R-package designed for gap-filling of the missing eddy
covariance CO2 flux measurements with the use of simple user-friendly
GUI supported R scripts.

## Cite

Premrov, A. (2024) ‘miniRECgap’: R-package for gap-filling of the
missing eddy covariance CO2 flux measurements using selected classic
nonlinear environmental response functions via simple user-friendly GUI
supported R scripts. Version: 0.1.0. [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.13228228.svg)](https://doi.org/10.5281/zenodo.13228228)

FUTURE PUBLICATION: Alina Premrov, et.al. (in prep. 2024).

## References for the nonlinear environmental response functions applied in ‘miniRECgap’:

Lloyd, J., Taylor, J.A. (1994) On the temperature dependence of soil
respiration. Functional Ecology, 8, 315-323. DOI:
<https://doi.org/10.2307/2389824>

Rabinowitch, E.I. (1951) Photosynthesis and Related Processes.
Interscience Publishers.

Gilmanov, T.G., Verma, S.B., Sims, P.L., Meyers, T.P., Bradford, J.A.,
Burba, G.G., Suyker, A.E. (2003) Gross primary production and light
response parameters of four Southern Plains ecosystems estimated using
long-term CO2-flux tower measurements. Global Biogeochemical Cycles,
17/2, 1071, <DOI:10.1029/2002GB002023>.

## Installation

‘miniRECgap’ installation via GitHub

``` r
# # install.packages("devtools")
# # If you have not installed devtools before you will need to restart your R session.

library(devtools)

# install_github('APremrov/miniRECgap')

# Load miniRECgap
library('miniRECgap')

as.environment("package:miniRECgap")
```

‘Imports - ’miniRECgap’ package requires that the following packages are
pre-installed

``` r
# # install.packages(c('stats','utils','fgui','dplyr','ggplot2','grDevices'))
lapply((c('stats','utils','fgui','dplyr','ggplot2','grDevices'), require, character.only = TRUE)
```

## Example

Example using the ‘miniRECgap’ package will be provided in publication
Premrov et al. (in prep. 2024). The reference Premrov et al. (in prep
2024) will be updated once the paper is published.
