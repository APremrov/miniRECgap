#' The 'guiCallbackRecoMOD' is the GUI callback function required for creating the GUI
#' that supports 'Plot_RecoMod_T' function for plotting RecoMOD.
#' It requires 'fgui' package. Please ensure to cite the required packages.
#' @export
#'
#library('fgui')
#library('utils')

guiCallbackRecoMOD <- function( arg ) {
  if( arg=="csvFileRecoMOD" ) {
    datanames <- names( read.csv( guiGetValue("csvFileRecoMOD") ) )
    guiSet( "datanames", datanames )
  }
}
