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
input_table_r6.create_model <- function() {
#print("Creating model...")   
  # create list store
  input_table_r6.model <<- gtkListStoreNew("gchararray", "gchararray", rep("gdouble", 2), "gboolean")  
  add.input_table_r6()
  # add items 
  for (i in 1:length(input_table_r6_list)) {
    iter <- input_table_r6.model$append()$iter
   #print(paste("in sexratios.model:", as.character(sexratios[[i]]$month)))
    input_table_r6.model$set(iter,0, input_table_r6_list[[i]]$fleet_segment)
    for (e in 1:length(c("to be reduced", "% vessel red.", "% days reduction"))) {
   # print(paste("in model:", years[nc]) )
              if (e==1) {
         input_table_r6.model$set(iter, e, input_table_r6_list[[i]][e+1])
      } else {
         input_table_r6.model$set(iter, e, as.numeric(input_table_r6_list[[i]][e+1]))
         }
    }
       input_table_r6.model$set(iter, 4,TRUE)
  } 
  #print("input_table_r6 Model successfully created!")  
}
