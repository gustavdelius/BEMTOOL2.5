# ALADYM  Age length based dynamic model - version 12.3
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# ALADYM is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.




#
# ------------------------------------------------------------------------------
# add elements to the list of total mortality values (FEMALES)
# ------------------------------------------------------------------------------
#
add.FishingMvector_F_fore <- function() {

if (!IN_BEMTOOL | (IN_BEMTOOL & phase=="SIMULATION") ) {
  n_ages <- as.numeric(gtkEntryGetText(entryVBF_F_lifespan))  
} else {
  n_ages <- as.numeric(new_aldPopulation@lifespan[2,1])      
} 

    n_ages <- n_ages - trunc(Tr/12)
    first_age_fem <- trunc(Tr/12)

#print("Adding elements to the list...")   
  if (!is.null(mortality.Fvector.females_fore)) {
  for (r in 1:nrow(mortality.Fvector.females_fore)) {
  FF_temp <- as.list(mortality.Fvector.females_fore[r,]) 
  # names(FF_temp) <- c("year",paste("age", c(0:(n_ages-1)), sep=""))
    names(FF_temp) <-  c("year",paste("age", c(first_age_fem:(n_ages+first_age_fem-1)), sep="") )
  FishingMvector_F_fore <<- c(FishingMvector_F_fore, list(FF_temp)) 
  }
   } else {
   FF_matrix <- data.frame(matrix(-1, nrow=length(years.forecast), ncol=(n_ages+1)))
     # colnames(FF_matrix) <- c("year",paste("age", c(0:(n_ages-1)), sep=""))   
      colnames(FF_matrix) <-   c("year",paste("age", c(first_age_fem:(n_ages+first_age_fem-1)), sep="") )
     FF_matrix$year <- years.forecast
   for (r in 1:nrow(FF_matrix)) { 
  FF_temp <- as.list(FF_matrix[r,]) 
  FishingMvector_F_fore <<- c(FishingMvector_F_fore, list(FF_temp)) 
  }
 }
 #print("Fishing mortality (FEMALES) successfully added to the list!", quote=F)
}

