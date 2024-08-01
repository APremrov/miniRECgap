#' The 'guiCallb_RecoM' is the GUI callback function required for creating the GUI
#' that supports 'CalcRecoMOD' function (see also the 'CalcRecoMOD' function).
#' It requires 'fgui' package. Please ensure to cite the required packages.
#' @export

#library('fgui')
#library('utils')

guiCallb_RecoM <- function( arg ) {
  if( arg=="csvFilename_initialData" ) {
    datanames <- names( read.csv( guiGetValue("csvFilename_initialData") ) )
    guiSet( "datanames", datanames )
  }
}
