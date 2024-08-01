#' Function 'OptimR10' reads the nighttime flux data ('Reco_night.csv'),
#' extracts variables T and Reco, defines X0 (from GUI input), which is the chosen value  that
#' represents initial arbitrary value for R10 prior to optimisation.
#'
#' Function 'FunReco_Mod' is the modified Arrhenius equation adapted from Lloyd and Taylor (1994),
#' which is used to calculate modelled Reco:
#' Reco= R10  ·   e ^ (E0  ·  ( 1/(283.2 -To) – 1/(T-To))) ,
#' where: Reco is ecosystem respiration, R10 is respiration rate at 10°C  (µmol CO2 m^(-2) s^(-1)),
#' ^ is power-sign; E0 is activation energy (309 K), temperature T0 = 230 K,
#' and T is  measured temperature in K.
#' Optimisation  of R10 is performed using function 'optim' from R 'stats' package
#' by applying the 'L-BFGS-B' method/algorithm of Byrd et al. (1995).
#' The output (optimised R10) is  written in the R-Console.
#'
#' References:
#' - Lloyd, J., Taylor, J.A. (1994) On the temperature dependence of soil respiration. Functional Ecology, 8, 315-323. DOI: https://doi.org/10.2307/2389824".
#' - Byrd, R.H., Lu, P., Nocedal, J., Zhu, C. (1995) A Limited Memory Algorithm for Bound Constrained Optimization.  16, 1190-1208.
#'
#' Please ensure to also cite the required packages.
#'
#' @export

#library('utils')

OptimR10 <- function(csvFilename_reco, x0) {
  data <- read.csv(csvFilename_reco, header=TRUE) # loading file
  T<-data$T
  Reco<-data$Reco # getting the variables


  # the function FunReco_Mod below represents modified Arrhenius equation adapted from Lloyd and Taylor (1994)
  FunReco_Mod <- function(x) {
    y=0
    Reco<-data$Reco
    #initialize values
    #variables will be optimised to find the minimum value of fun
    R10 = x[1]
    RecoMOD <- R10*(exp(309*((1/(283.2-230))-((1/((T+273.2)-230))))))
    y = sum((RecoMOD - Reco)^2)
    return(y)
  }
  # running optimisation algorithm on R10
  OptiY <-optim(x0,FunReco_Mod, method="L-BFGS-B")
  R10o<-OptiY$par
  R10o

}
