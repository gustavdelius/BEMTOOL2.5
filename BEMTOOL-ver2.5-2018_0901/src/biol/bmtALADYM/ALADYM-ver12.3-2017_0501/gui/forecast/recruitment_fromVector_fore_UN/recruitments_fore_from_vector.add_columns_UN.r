# ALADYM  Age length based dynamic model - version 12.3
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# ALADYM is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





#
#
#
#
#
#
#
#
#
#
# ------------------------------------------------------------------------------
# Add the columns to to be rendered in the tree
# ------------------------------------------------------------------------------
#
recruitments_fore_from_vector.add_columns_UN <- function(treeview) {
#print("Adding column to the model...")   
  recruitments_fore_from_vector.model_UN <- treeview$getModel()
  # number column
  renderer <- gtkCellRendererTextNew()
  # gSignalConnect(renderer, "edited", cell.edited, model)
  year_frame <- data.frame(c(0))	
  colnames(year_frame) <- c("run_N")			       
  renderer$setData("column", year_frame)
  treeview$insertColumnWithAttributes(-1, "run_N" , renderer, text = 0, editable = FALSE)
  
  year_frame <- data.frame(c(0))	
  colnames(year_frame) <- c("a")			       
  renderer$setData("column", year_frame)
  treeview$insertColumnWithAttributes(-1, "a" , renderer, text = 1, editable = TRUE)  
  
    year_frame <- data.frame(c(0))	
  colnames(year_frame) <- c("b")			       
  renderer$setData("column", year_frame)
  treeview$insertColumnWithAttributes(-1, "b" , renderer, text = 2, editable = TRUE)  
  
      year_frame <- data.frame(c(0))	
  colnames(year_frame) <- c("c")			       
  renderer$setData("column", year_frame)
  treeview$insertColumnWithAttributes(-1, "c" , renderer, text = 3, editable = TRUE)  

}
