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
# add elements to the list of stock-recruitment_fore_from_vector values
# ------------------------------------------------------------------------------
#
add_maturity_uncert_females_from_file <- function() {
#print("Adding elements to the list...")   
  if (!is.null(maturity_uncert_females_from_file_matrix)) {
  for (r in 1:nrow(maturity_uncert_females_from_file_matrix)) {
  sr_temp <- as.list(maturity_uncert_females_from_file_matrix[r,]) 
  names(sr_temp) <- c("run_N", "L50", "L75L25") 
  maturity_uncert_females_from_file_list <<- c(maturity_uncert_females_from_file_list, list(sr_temp)) 
  }
   } else {
    zero_matrix <- data.frame(matrix(-1, nrow=CI_NB_RUNS_FORE, ncol=3 ))
     colnames(zero_matrix) <- c("run_N", "L50", "L75L25") 
   for (r in 1:nrow(zero_matrix)) { 
  sr_temp <- as.list(zero_matrix[r,]) 
  maturity_uncert_females_from_file_list <<- c(maturity_uncert_females_from_file_list, list(sr_temp)) 
  }
   
 }
# print("recruitments_fore_from_vector list successfully updated!", quote=F)
}

