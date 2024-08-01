#' The 'guiCallbackreco' is the GUI callback function required for creating the GUI
#' that supports 'ProcessDataReco' function.
#' It requires 'fgui' package. Please ensure to cite the required packages.
#' @export

#library('fgui')
#library('utils')
guiCallbackreco <- function( arg ) {
  if( arg=="csvFilename_reco" ) {
    datanames <- names( read.csv( guiGetValue("csvFilename_reco") ) )
    guiSet( "datanames", datanames )
  }
}
