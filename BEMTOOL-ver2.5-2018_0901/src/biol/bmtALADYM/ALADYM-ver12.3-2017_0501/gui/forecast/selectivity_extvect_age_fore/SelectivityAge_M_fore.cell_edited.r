# ALADYM  Age length based dynamic model - version 12.3
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# ALADYM is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





#
# ------------------------------------------------------------------------------
# Function for the editing of the cells
# ------------------------------------------------------------------------------
#
SelectivityAge_M_fore.cell_edited <- function(cell, path.string, new.text, data) {
if (is.na(as.double(new.text) )) {
      showError("Value for Selectivity by age must be a number!")
 } else {  
  #checkPtrType(data, "GtkListStore")
  SelectivityAge_M_fore.model <- data 
  path <- gtkTreePathNewFromString(path.string)
  print(paste("Selectivity by age (MALES) Edited row:", (as.numeric(path.string)+1)))
  column <- as.integer(cell$getData("column"))
  print(paste("Selectivity by age (MALES) Edited column:", column))
  iter <- SelectivityAge_M_fore.model$getIter(path)$iter
   #print(paste("new text:", new.text))
  	i <- path$getIndices()[[1]]+1
  	#print(paste("indice i:", i))
  	#print(Zvector_M[[i]])
  	SelectivityAge_M_fore_list[[i]][column+1] <<- as.double(new.text)           # [column+1]
  #	print(paste("indice column:", column+1))
  #	print(Zvector_M[[i]][column+1])
  	SelectivityAge_M_fore.model$set(iter, column, SelectivityAge_M_fore_list[[i]][column+1])
  	
  	# FleetList_simulation[[gtkComboBoxGetActive(combo_fleetsegments)+1]]@SelectivityAge.M.vector <<- get_table("FISHING_MORTALITY_M")
  	}
}

