#' Function 'Plot_RecoMod_T' generates a  time-series plot of RecoMod and T;
#' (see explanation in function 'CalcRecoMOD').
#'
#' Please ensure to cite the required packages.
#'
#' @export

# library('ggplot2')

Plot_RecoMod_T <- function(csvFileRecoMOD) {
  data1 <- read.csv( csvFileRecoMOD )
  data1$DateTime<-as.character(data1$DateTime)
  data1[['DateTime']]<- as.POSIXct(data1[['DateTime']],format = "%d/%m/%Y %H:%M")
  ggplot(data1, aes(x=DateTime)) +
    geom_line( aes(y=RecoMOD), size=0.5, color= "#69b3a2") +
    geom_line( aes(y=T), size=0.5, color=rgb(0.2, 0.6, 0.9, 1)) +
    scale_y_continuous(
      # Features of the first axis
      name = "RecoMOD",
      # Add a second axis and specify its features
      sec.axis = sec_axis(~., name="Temp"),
    ) +
    theme(axis.title.y= element_text(color = "#69b3a2"), axis.title.y.right = element_text(color =rgb(0.2, 0.6, 0.9, 1)))

}
