#' Function 'PartECdata' performs eddy covariance (EC) flux data partitioning into nighttime and daytime,
#' screens the nighttime fluxes to remove any negative values,
#' writes the nighttime flux data into separate file ('Reco_night.csv'),
#' and calls next GUI (which will use function 'ProcessDataReco').
#'
#' The EC flux data are partitioned using the chosen photosynthetic photon flux density (PPFD)
#' threshold value of 20.2 µ mol (quanta) m^(-2) s^(-1).
#' This PPDF threshold was estimated using the incoming solar radiation  (Rg)
#' threshold value of 10 W m^(-2) according to  Wutzler et al. (2018), which was converted
#' into PPDF using the conversion factor of 2.02 (reported in dos Reis and Ribeiro, 2020).
#'
#' References:
#' - Wutzler, T., Lucas-Moffat, A., Migliavacca, M., Knauer, J., Sickel, K., Šigut, L., Menzer, O., Reichstein, M. (2018) Basic and extensible post-processing of eddy covariance flux data with REddyProc. Biogeosciences 15, 5015-5030, DOI: 10.5194/bg-15-5015-2018.
#' - dos Reis, M., Ribeiro, A. (2020) Conversion factors and general equations applied in agricultural and forest meteorology.  27, 227-258, URL: https://www.researchgate.net/publication/339896036 (Date Last Accessed June 2024).
#'
#' Please ensure to cite the required packages.
#'
#' @export

#library('fgui')
#library('utils')

PartECdata <- function(csvFilename) {
  data <- read.csv( csvFilename )
  data1<-subset(data, PPFD < 20.2 & PPFD != 20.2)
  data2<-na.omit(data1)
  data3<-subset(data2, NEE > 0)
  Reco<-data3$NEE
  T<-data3$T
  Reco_night <- as.data.frame(cbind(Reco, T))
  write.csv( Reco_night, "Reco_night.csv", row.names=FALSE)
  guiv(ProcessDataReco, argFilename=list(csvFilename_reco=NULL), callback=guiCallbackreco, title="Nighttime Reco", closeOnExec=TRUE)
}
