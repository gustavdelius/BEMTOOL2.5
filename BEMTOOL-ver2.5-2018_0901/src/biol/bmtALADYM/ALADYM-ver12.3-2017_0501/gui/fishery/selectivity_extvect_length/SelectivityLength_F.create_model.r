# ALADYM  Age length based dynamic model - version 12.3
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# ALADYM is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.






#
# ------------------------------------------------------------------------------
# create model for the tree of total mortality
# ------------------------------------------------------------------------------
#
SelectivityLength_F.create_model <- function() {


if (!IN_BEMTOOL | (IN_BEMTOOL & phase=="SIMULATION") ) {
 l_inf <- as.numeric(gtkEntryGetText(entryVBFLinf_M_max))  
} else {
   l_inf <- as.numeric(new_aldPopulation@growth[3,3])      
} 

l_inf_lens <- c(0:(round(l_inf,0)+1))

#print("Creating model...")   
  # create list store
  SelectivityLength_F.model <<- gtkListStoreNew( rep("gdouble", (length(years)+1)), "gboolean")  
  add.SelectivityLength_F()
  # add items 
  for (i in 1:length(SelectivityLength_F_list)) {
    iter <- SelectivityLength_F.model$append()$iter
   #print(paste("in sexratios.model:", as.character(sexratios[[i]]$month)))
    SelectivityLength_F.model$set(iter,0, SelectivityLength_F_list[[i]]$Length)
    for (e in 1:(length(years)) ) {
   # print(paste("in model:", years[nc]) )
         SelectivityLength_F.model$set(iter, e, as.numeric(SelectivityLength_F_list[[i]][e+1]))
    }
       SelectivityLength_F.model$set(iter, (length(years)+1),TRUE)
  } 
 # print("Total mortality (MALES) Model successfully created!")  
}

