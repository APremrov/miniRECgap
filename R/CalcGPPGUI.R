#' Function 'CalcGPPGUI' calls GUI to calculate and plot GPP data based on the function 'CalcGPP'.
#' It calls the GUI that will ask user to upload the data to be used in 'CalcGPP' function
#' (see 'CalcGPP' function for further details).
#' GUI window is created using 'guiv' function from  'fgui' package. Please ensure to cite the required packages.
#' @export

#library('fgui')

CalcGPPGUI<- function(CalcGPP) {
  guiv(CalcGPP, argFilename=list(csvFileRecoMOD=NULL), callback=guiCallbackRecoMOD, title="Upload RecoMOD & plot GPP-PPFD", closeOnExec=TRUE)
}
