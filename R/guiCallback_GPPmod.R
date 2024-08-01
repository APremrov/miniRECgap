#' The 'guiCallback_GPPmod' is the GUI callback function required for creating the GUI
#' that supports 'ModGPP' function to call GUI for 'GFillData' function 
#' (see also functions 'ModGPP'  and  'GFillData').
#' It requires 'fgui' package. Please ensure to cite the required packages.
#' @export

#library('fgui')
#library('utils')

guiCallback_GPPmod<- function( arg ) {
  if( arg=="csvFileGPP_MOD" ) {
    datanames <- names( read.csv( guiGetValue("csvFileGPP_MOD") ) )
    guiSet( "datanames", datanames )
  }
}
