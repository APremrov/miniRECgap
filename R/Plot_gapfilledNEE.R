#' Function 'Plot_gapfilledNEE'  plots the gap-filled NEE (blue colour) together
#' with observed/measured NEE that contains gaps (green colour); (see explanation in function 'GFillData').
#'
#' Please ensure to cite the required packages.
#'
#'
#' @export


#library('ggplot2')
#library('utils')

Plot_gapfilledNEE <- function(csvFileGapFilled) {
  data <- read.csv( csvFileGapFilled )
  data$DateTime<-as.character(data$DateTime)
  data[['DateTime']]<- as.POSIXct(data[['DateTime']],format = "%d/%m/%Y %H:%M")
  ggplot(data, aes(x=DateTime)) +
    geom_point( aes(y=NEE),  shape= 1, size=3, color= "#69b3a2") +
    geom_line( aes(y=GapFilledNEE),size=0.25, color=rgb(0.2, 0.6, 0.9, 1)) +
    geom_point( aes(y=GapFilledNEE),size=0.5, color=rgb(0.2, 0.6, 0.9, 1)) +
    scale_y_continuous(
      # Features of the first axis
      name = "NEE (with gaps)",
      # Add a second axis and specify its features
      sec.axis = sec_axis(~., name="Gap Filled NEE"),
    ) +
    theme(axis.title.y= element_text(color = "#69b3a2"), axis.title.y.right = element_text(color =rgb(0.2, 0.6, 0.9, 1)))

}
