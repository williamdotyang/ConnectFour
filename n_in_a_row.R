n.in.a.row = function(player, v, n) {
  #if a given vector v contains n continuous player, returns TRUE
  for (i in 1:length(v)) {
    num = 0
    if (v[i] != player) {
      next
    }
    for (j in i:length(v)) {
      if (v[j] == player) {
        num = num + 1
        if (num >= n) {
          return(TRUE)
        } 
      } else {
        break
      }
    }
  }
  return(FALSE) # correct this return() statement
}
