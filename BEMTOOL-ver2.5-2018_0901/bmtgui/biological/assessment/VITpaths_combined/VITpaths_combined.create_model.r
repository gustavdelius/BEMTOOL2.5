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
# create model for the tree of selectivity
# ------------------------------------------------------------------------------
#
VITpaths_combined.create_model <- function() {

  VITpaths_combined.model <<- gtkListStoreNew("gchararray",  "gchararray", "gboolean")  

  add.VITpaths_combined()
  # add items 
  
    if (!is.null(VITpaths_combineds) ) {  
 for (i in 1:length(VITpaths_combined_list)) {
    iter <-  VITpaths_combined.model$append()$iter
    VITpaths_combined.model$set(iter,0, as.character(VITpaths_combined_list[[i]][[1]]))
   VITpaths_combined.model$set(iter,1, as.character(VITpaths_combined_list[[i]][[2]]))       
     VITpaths_combined.model$set(iter,2,FALSE)
  } 
   }       
 # print("Discard Model successfully created!")  
}
