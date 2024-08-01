#' Function 'ProcessDataReco' reads the nighttime flux data ('Reco_night.csv'),
#' extracts variables T and Reco and plots them (see explanation in function 'PartECdata').
#' Please ensure to cite the required packages.
#' @export

#library('ggplot2')
#library('utils')
ProcessDataReco <- function(csvFilename_reco) {
  data4 <- read.csv( csvFilename_reco, header=TRUE)
  Temp<-data4$T
  Reco<-data4$Reco
  plot(Temp, Reco)

}
