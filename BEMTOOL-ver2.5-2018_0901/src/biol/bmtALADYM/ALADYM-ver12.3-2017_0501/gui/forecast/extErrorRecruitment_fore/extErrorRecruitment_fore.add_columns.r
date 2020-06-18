# ALADYM  Age length based dynamic model - version 12.3
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# ALADYM is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.



# ---------------------------------- add the columns to to be rendered in the tree
extErrorRecruitment_fore.add_columns <- function(treeview) {


extErrorRecruitment_fore.model <- treeview$getModel()
  # number column
  
    renderer <- gtkCellRendererTextNew()
    month_frame <- data.frame(c(0))	
    colnames(month_frame) <- c("run_N")			       
  renderer$setData("column", month_frame)
  treeview$insertColumnWithAttributes(-1, c(" run_N "), renderer, text = 0, editable = FALSE)
  
  for (e in 1:length(years_forecast)) {
  # number column
  renderer <- gtkCellRendererTextNew()
  gSignalConnect(renderer, "edited", extErrorRecruitment_fore.cell_edited, extErrorRecruitment_fore.model)
    month_frame <- data.frame(c(e))	
    colnames(month_frame) <- c(years_forecast[e])			       
  renderer$setData("column", month_frame)
  treeview$insertColumnWithAttributes(-1, as.character(years_forecast[e]), renderer, text = e, editable = (years_forecast))
}


}

