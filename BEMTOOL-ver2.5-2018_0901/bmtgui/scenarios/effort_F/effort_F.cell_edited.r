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
# Function for the editing of the cells
# ------------------------------------------------------------------------------
#
bmt_effort_F.cell_edited <- function(cell, path.string, new.text, data) {
  if (is.na(as.double(new.text) )) {
      if ((as.numeric(path.string)+1) != 1) {
      showError("a and b coefficients must be numbers!")
      }
 } else {
    bmt_effort_F.model <- data 
  path <- gtkTreePathNewFromString(path.string)
  print(paste("effort-F Edited row:", (as.numeric(path.string)+1)))
  column <- as.integer(cell$getData("column"))
  print(paste("effort-F Edited column:", column))
  iter <- bmt_effort_F.model$getIter(path)$iter
   #print(paste("new text:", new.text))
  	i <- path$getIndices()[[1]]+1
  	#print(paste("indice i:", i))
  #	print(pproductions[[i]])
  	bmt_effort_F_list[[i]][column+1] <<- new.text           # [column+1]
  #	print(paste("indice column:", column+1))
  #	print(pproductions[[i]][column+1])
  	bmt_effort_F.model$set(iter, column, bmt_effort_F_list[[i]][column+1])

         for (r in 1:length(bmt_effort_F_list)) {
 bmt_effort_F[r,] <<- as.character(bmt_effort_F_list[[r]])
  }

}
}
