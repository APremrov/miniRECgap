#' Function 'ModGFillGUI' calls GUI to model GPP using obtained optimised parameter values (α, Amax, γ)
#' used in the light-response function adapted from Rabinowitch (1951), reported in Gilmanov et al. (2003).
#' The GUI will call function 'ModGPP' (see 'ModGPP'function for further details).
#'
#' References:
#' - Rabinowitch, E.I. (1951) Photosynthesis and Related Processes. Interscience Publishers.
#' - Gilmanov, T.G., Verma, S.B., Sims, P.L., Meyers, T.P., Bradford, J.A., Burba, G.G., Suyker, A.E. (2003) Gross primary production and light response parameters of four Southern Plains ecosystems estimated using long-term CO2-flux tower measurements. Global Biogeochemical Cycles, 17/2, 1071, DOI:10.1029/2002GB002023.
#'
#' GUI window is created using 'guiv' function from  'fgui' package. Please ensure to cite the required packages.
#'
#' @export

ModGFillGUI<- function(ModGPP) {
  guiv(ModGPP, argFilename=list(csvFileRecoMOD=NULL), callback=guiCallbackRecoMOD, title="Modelling GPP", closeOnExec=TRUE)
}
