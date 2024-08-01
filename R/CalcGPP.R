#' Function 'CalcGPP' calculates the  GPP from NEE and RecoMOD using daytime flux data.
#' In order to obtain the calculated GPP, the half-hourly flux data (including RecoMOD)
#' are first partitioned applying the chosen photosynthetic photon flux density (PPFD)
#' threshold value for daytime/nighttime partitioning of eddy covariance (EC) flux data.
#' The PPDF threshold value of 20.2 µ mol (quanta) m^(-2) s^(-1) is used. This PPDF threshold was estimated
#' using the incoming solar radiation  (Rg) threshold value of 10 W m^(-2) according to  Wutzler et al. (2018),
#' which was converted into PPDF using the conversion factor of 2.02 (reported in dos Reis and Ribeiro, 2020).

#' The calculation of GPP is based on the equation
#' NEE = GPP + Reco
#' in units in µ mol CO2-C m^(-2) s^(-1);(Baldocchi and Valentini, 2004; MPI, 2024; Reichle, 2019),
#' where: GPP is gross primary productivity, NEE is net ecosystem exchange, Reco is ecosystem respiration.
#' The calculation of GPP also includes multiplication of calculated GPP by -1 to switch the sign convention.
#' The function writes calculated output into csv file 'GPPWorksheet.csv' and plots calculated GPP and PPFD.
#' At the end it calls next GUI that will call function 'OptimLight' to perform optimisation
#' of light-response function (see also function 'OptimLight').
#' GUI window is created using 'guiv' function from  'fgui' package. Please ensure to cite the required packages.
#'
#' References:
#' - Wutzler, T., Lucas-Moffat, A., Migliavacca, M., Knauer, J., Sickel, K., Šigut, L., Menzer, O., Reichstein, M. (2018) Basic and extensible post-processing of eddy covariance flux data with REddyProc. Biogeosciences 15, 5015-5030, DOI: 10.5194/bg-15-5015-2018.
#' - dos Reis, M., Ribeiro, A. (2020) Conversion factors and general equations applied in agricultural and forest meteorology.  27, 227-258, URL: https://www.researchgate.net/publication/339896036 (Date Last Accessed June 2024).
#' - Baldocchi, D., Valentini, R. (2004) Geographic and temporal variation of carbon exchange by ecosystems and their sensitivity to environmental perturbations  SCOPE-Scientific Committee on Problems of the Environment International Council of Scientific Unions.
#' - MPI, (2024) REddyProc Web online tool. FAQ.  "Why does negative NEE define an net uptake of the ecosystem?. Max Planck Institute (MPI), Biogeosciences. URL: https://www.bgc-jena.mpg.de/5629512/FAQ (Date Last Accessed June 2024).
#' - Reichle, D. (2019) The global carbon cycle and climate change. Elsevier. DOI: https://doi.org/10.1016/C2019-0-01382-9.
#'
#'
#' @export

#library('fgui')
#library('utils')
#library('ggplot2')

CalcGPP <- function(csvFileRecoMOD) {
  data <- read.csv( csvFileRecoMOD)
  data1<-subset(data, PPFD > 20.2 & PPFD != 20.2)
  data2<-na.omit(data1)
  data3<-subset(data2, NEE < 0)
  data3$GPP <- (data3$NEE - data3$RecoMOD)*(-1)
  write.csv(data3, "GPPWorksheet.csv", row.names=FALSE)
  data4<-read.csv('GPPWorksheet.csv', header=TRUE)
  PPFD<-data4$PPFD
  GPP<-data4$GPP
  plot(PPFD, GPP)
  guiv(OptimLight, argFilename=list(csvFilename_gpp=NULL), callback=guiCallbackgpp, title="ComputeGPP to optimise parameters",closeOnExec=TRUE)

}
