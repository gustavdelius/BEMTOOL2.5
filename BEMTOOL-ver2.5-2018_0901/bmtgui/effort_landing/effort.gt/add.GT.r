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
# add elements to the list of the p production values
# ------------------------------------------------------------------------------
#
bmt_add.GT <- function() {
#print("Adding elements to the list...")   
  if (!is.null(bmt_fleet.GT)) {
  for (r in 1:nrow(bmt_fleet.GT)) {
  GT_temp <- as.list(bmt_fleet.GT[r,]) 
  names(GT_temp) <- c("year",MONTHS)
  bmt_GT_list <<- c(bmt_GT_list, list(GT_temp)) 
  }
   } else {
   GT_matrix <- data.frame(matrix(0, nrow=length(years), ncol=13))
   colnames(GT_matrix) <- c("year",MONTHS)
     GT_matrix$year <- years
   for (r in 1:nrow(GT_matrix)) { 
  GT_temp <- as.list(GT_matrix[r,]) 
  bmt_GT_list <<- c(bmt_GT_list, list(GT_temp)) 
  }
 }
#print("GT (simulation) list successfully updated!", quote=F)
}