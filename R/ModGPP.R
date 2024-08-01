#' Function 'ModGPP' calculates the modelled GPP using optimised model parameters α, Amax, γ, applied to the
#' light-response function
#' GPP = (α · PPFD+Amax)-(sqrt(((α · PPFD+Amax)^2)-((4 · γ)· (PPFD · α · Amax))))/(2 · γ)
#' which is adapted from non-rectangular hyperbola (NRH) model by Rabinowitch (1951), reported in Gilmanov et al. (2003).
#' The modelled GPP is calculated using the and the data 'RecoMOD.csv' file obtained from 'CalcRecoMOD' function.
#' It saves the calculated modelled GPP in csv file ('GPP_MOD.csv').
#' At the end it calls next GUI that will call function 'GFillData' to perform further processing and finally the gap-filling of NEE.
#'
#' References:
#' - Rabinowitch, E.I. (1951) Photosynthesis and Related Processes. Interscience Publishers.
#' - Gilmanov, T.G., Verma, S.B., Sims, P.L., Meyers, T.P., Bradford, J.A., Burba, G.G., Suyker, A.E. (2003) Gross primary production and light response parameters of four Southern Plains ecosystems estimated using long-term CO2-flux tower measurements. Global Biogeochemical Cycles, 17/2, 1071, DOI:10.1029/2002GB002023.
#'
#' GUI window is created using 'guiv' function from  'fgui' package. Please ensure to cite the required packages.
#'
#' @export

#library('fgui')
#library('utils')
ModGPP <- function(csvFileRecoMOD, α, Amax, γ) {
  data <- read.csv( csvFileRecoMOD)
  data$GPPMod <- (α*data$PPFD+Amax)-(sqrt(((α*data$PPFD+Amax)^2)-((4*γ)*(data$PPFD*α*Amax))))/(2*γ)
  write.csv(data, "GPP_MOD.csv", row.names=FALSE)
  guiv(GFillData, argFilename=list(csvFileGPP_MOD=NULL), callback=guiCallback_GPPmod, title="Gap-Fill data", closeOnExec=TRUE)
}
