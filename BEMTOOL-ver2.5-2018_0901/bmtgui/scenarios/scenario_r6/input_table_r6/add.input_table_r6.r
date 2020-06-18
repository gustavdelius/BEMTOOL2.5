# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
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
# add elements to the list of the p production values
# ------------------------------------------------------------------------------
#
add.input_table_r6 <- function() {
#print("Adding elements to the list...")   
  if (!is.null(input_table_r6)) {
  for (r in 1:nrow(input_table_r6)) {
  input_table_r6_temp <- as.list(input_table_r6[r,]) 
  names(input_table_r6_temp) <- c("fleet_segment", "to be reduced", "% vessel red.", "% days reduction")
  input_table_r6_list <<- c(input_table_r6_list, list(input_table_r6_temp)) 
  }
   } else {
   input_table_r6_matrix <- data.frame(matrix(0, nrow=length(BMT_FLEETSEGMENTS), ncol=4))
   colnames(input_table_r6_matrix) <- c("Fleet segment", "to be reduced", "% vessel red.", "% days reduction")
     input_table_r6_matrix$fleet_segment <- BMT_FLEETSEGMENTS
   for (r in 1:nrow(input_table_r6_matrix)) { 
  input_table_r6_temp <- as.list(input_table_r6_matrix[r,]) 
  input_table_r6_list <<- c(input_table_r6_list, list(input_table_r6_temp)) 
  }
 }
#print("input_table_r6 (simulation) list successfully updated!", quote=F)
}