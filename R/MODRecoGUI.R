#' Function 'MODRecoGUI' calls the GUI to upload the optimised Reco value and the initial EC flux data.
#' The GUI will call function 'CalcRecoMOD' to calculate the modelled Reco using optimised R10 value by applying the
#' modified Arrhenius equation adapted from Lloyd and Taylor (1994); it will write the data into new csv. file
#' (RecoMOD.csv);(see 'CalcRecoMOD' function for further details and references).
#' GUI window is created using 'guiv' function from  'fgui' package. Please ensure to cite the required packages.
#'
#' @export

#library('fgui')
#library('utils')

MODRecoGUI<- function(CalcRecoMOD) {
  guiv(CalcRecoMOD, argFilename=list(csvFilename_initialData=NULL), callback=guiCallb_RecoM, title="Upload data & fill optimR10", closeOnExec=TRUE)
}
