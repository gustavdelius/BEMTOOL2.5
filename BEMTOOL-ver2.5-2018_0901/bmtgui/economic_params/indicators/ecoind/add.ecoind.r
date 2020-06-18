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
bmt_add.ecoind <- function() {
#print("Adding elements to the list...")   
  if (!is.null(bmt_fleet.ecoind)) {
  for (r in 1:nrow(bmt_fleet.ecoind)) {
  ecoind_temp <- as.list(bmt_fleet.ecoind[r,]) 
  names(ecoind_temp) <-  c(" ",BMT_FLEETSEGMENTS)
  bmt_ecoind_list <<- c(bmt_ecoind_list, list(ecoind_temp)) 
  }
   } else {
   ecoind_matrix <- data.frame(matrix(0, nrow=length(ECOIND_head), ncol=(length(BMT_FLEETSEGMENTS)+1)))
   colnames(ecoind_matrix) <-  c(" ",BMT_FLEETSEGMENTS)
     ecoind_matrix[,1] <- ECOIND_head
     if (length(BMT_FLEETSEGMENTS) != 0) {
   for (r in 1:nrow(ecoind_matrix)) { 
  ecoind_temp <- as.list(ecoind_matrix[r,]) 
  bmt_ecoind_list <<- c(bmt_ecoind_list, list(ecoind_temp)) 
  }
  }
 }
#print("ecoind (simulation) list successfully updated!", quote=F)
}