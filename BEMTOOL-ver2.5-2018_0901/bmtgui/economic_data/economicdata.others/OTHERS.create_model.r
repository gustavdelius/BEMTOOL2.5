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
# ------------------------------------------------------------------------------
# create model for the tree of p production
# ------------------------------------------------------------------------------
#
bmt_OTHERS.create_model <- function() {
#print("Creating model...")   
  # create list store
  bmt_OTHERS.model <<- gtkListStoreNew("gchararray",  rep("gdouble", length(OTHERS_vector)), "gboolean")  
  bmt_add.OTHERS()
  # add items 
  for (i in 1:length(bmt_OTHERS_list)) {
    iter <- bmt_OTHERS.model$append()$iter
   #print(paste("in sexratios.model:", as.character(sexratios[[i]]$month)))
    bmt_OTHERS.model$set(iter,0, bmt_OTHERS_list[[i]]$year)
    for (e in 1:length(OTHERS_vector)) {
   # print(paste("in model:", years[nc]) )
         bmt_OTHERS.model$set(iter, e, as.numeric(bmt_OTHERS_list[[i]][e+1]))
    }
       bmt_OTHERS.model$set(iter, (length(OTHERS_vector)+1),TRUE)
  } 
  #print("OTHERS Model successfully created!")  
}
