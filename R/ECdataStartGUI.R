#' Function 'ECdataStartGUI'  calls GUI to start with the post-processing of the EC flux data.
#' It then calls the GUI callback function 'guiCallb_PartECd' required for creating the GUI
#' that supports 'PartECdata' function, which will ask user to upload the data to partition the data
#' (see also functions 'guiCallb_PartECd' and 'PartECdata' ).
#' GUI window is created using 'guiv' function from  'fgui' package. Please ensure to cite the required packages.
#' @export

#library('fgui')

#search()
ECdataStartGUI<- function(PartECdata) {
  guiv(PartECdata, argFilename=list(csvFilename=NULL), callback=guiCallb_PartECd, title="Read data & partition", closeOnExec=TRUE)
}
