#' The 'guiCallb_PartECd' is the GUI callback function required for creating the GUI
#' that supports 'PartECdata' function (see also the 'PartECdata' function).
#' It requires 'fgui' package. Please ensure to cite the required packages.
#' @export

#library('fgui')
#library('utils')

guiCallb_PartECd <- function( arg ) {
  if( arg=="csvFilename" ) {
    datanames <- names( read.csv( guiGetValue("csvFilename") ) )
    guiSet( "datanames", datanames )
  }
}
