#' The 'guiCallbackgpp' is the GUI callback function required for creating the GUI
#' that supports 'OptimLight' function.
#' It requires 'fgui' package. Please ensure to cite the required packages.
#' @export
#
#library('fgui')
#library('utils')

guiCallbackgpp <- function( arg ) {
  if( arg=="csvFilename_gpp" ) {
    datanames <- names( read.csv( guiGetValue("csvFilename_gpp") ) )
    guiSet( "datanames", datanames )
  }
}
