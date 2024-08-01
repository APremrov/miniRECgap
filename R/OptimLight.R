#' Function 'OptimLight' is used to optimise parameters (α, Amax, γ) from light-response GPP function,
#' which is adapted from non-rectangular hyperbola (NRH) model by Rabinowitch (1951),
#' reported in Gilmanov et al. (2003); (for details on adapted NRH model equation see function 'ModGPP').
#'
#' Function 'FunGPPMod'  represents the light-response function equation (i.e. the adapted NRH model by
#' Rabinowitch (1951), reported in Gilmanov et al. (2003)).
#' The GPP is pre-modelled using function 'FunGPPMod' and initial parameter (α0, Amax0, γ0) values.
#' The  initial parameter values (α0 = 0.08, Amax = 15, γ= 0.5) are manually entered via
#' GUI that is called in function 'CalcGPP' (see also function 'CalcGPP' for further details - this function
#' at the end calls GUI that will call function 'OptimLight).
#'
#' x0 represents initial values -  the parameter values (α, Amax, γ), which are
#' at the start  filled with values  #' x= c(0.08, 15, 0.5) prior to optimisation and the
#' initial variable values are:  α = 0.08 , Amax =  15, γ = 0.5'
#' Next, the parameter values (α, Amax, γ) are optimised (using function 'optim'
#' from package 'stats' by minimising the residual sum of squares from computed and pre-modelled GPP.
#' The optimisation (using function 'optim') is performed by applying the 'BFGS' method/algorithm
#'  (Broyden, 1970; Fletcher, 1970; Goldfarb, 1970; Shanno, 1970).
#'
#' References:
#' - Rabinowitch, E.I. (1951) Photosynthesis and Related Processes. Interscience Publishers.
#' - Gilmanov, T.G., Verma, S.B., Sims, P.L., Meyers, T.P., Bradford, J.A., Burba, G.G., Suyker, A.E. (2003) Gross primary production and light response parameters of four Southern Plains ecosystems estimated using long-term CO2-flux tower measurements. Global Biogeochemical Cycles, 17/2, 1071, DOI:10.1029/2002GB002023.
#' - Broyden, C.G. (1970) The convergence of a class of double rank minimization algorithms: 2. The new algorithm. J. Inst. Math. Appl. 6, 222–231.
#' - Fletcher, R. (1970) A new approach to variable metric algorithms. Comput. J. 13, 317–322.
#' - Goldfarb, D. (1970) A family of variable metric methods derived by variational means. Math. Comp. 24, 23–26.
#' - Shanno, D.F. (1970) Conditioning of quasi-Newton methods for function minimization. Math. Comp. 24, 647–650.
#'
#' Please ensure to also cite the required packages.
#'
#' @export


#library('utils')

OptimLight <- function(csvFilename_gpp, α0, Amax0,γ0 ) {
  data_gpp <- read.csv(csvFilename_gpp, header=TRUE)
  GPP<-data_gpp$GPP
  PPFD<-data_gpp$PPFD
  x0= c(α0,Amax0,γ0)

  FunGPPMod <- function(x) {
    y=0 #initialize values
    GPPMod <- (x[1]*PPFD+x[2])-(sqrt(((x[1]*PPFD+x[2])^2)-((4*x[3])*(PPFD*x[1]*x[2]))))/(2*x[3])
    y = sum((GPPMod - GPP)^2)
    return(y)
  }



  suppressWarnings(
    OptiY2<-optim(x0,FunGPPMod, method="BFGS")
  )
  print(OptiY2)
  α<-OptiY2$par[1]
  Amax<-OptiY2$par[2]
  γ<-OptiY2$par[3]
  print("MODEL COEFFICIENTS")
  print("α          Amax         γ")
  X<-c( α, Amax, γ)
  X

}

