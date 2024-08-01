#' Function 'CalcRecoMOD' calculates the modelled Reco using optimised R10 values by applying the
#' modified Arrhenius equation adapted from Lloyd and Taylor (1994).
#' It will write the data into new csv file ('RecoMOD.csv').
#' At the end it calls next GUI that will ask user to upload the RecoMOD data and will plot the data.
#' 
#' References: 
#' - Lloyd, J., Taylor, J.A. (1994) On the temperature dependence of soil respiration. Functional Ecology, 8, 315-323. DOI: https://doi.org/10.2307/2389824".
#' 
#' GUI window is created using 'guiv' function from  'fgui' package. Please ensure to cite the required packages.
#' 
#' @export

#library('fgui')
#library('utils')

CalcRecoMOD <- function(csvFilename_initialData, R10o) {
data <- read.csv( csvFilename_initialData)
data$RecoMOD <- R10o*(exp(309*((1/(283.2-230))-((1/((data$T+273.2)-230))))))
write.csv(data, "RecoMOD.csv", row.names=FALSE)

guiv(Plot_RecoMod_T, argFilename=list(csvFileRecoMOD=NULL), title="Plot RecoMOD", callback=guiCallbackRecoMOD)

}
