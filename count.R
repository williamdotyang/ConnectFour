extract_continue = function(direction, index) {
  player = direction[index]
  #returns a vec of continuing series of player
  del_index_left = NULL
  del_index_right = NULL
  for (i in index:1) { #leftwards, eliminate alien
    if(direction[i] == "" | direction[i] != player) { 
      del_index_left = c(1:i)
      break
    }
  }
  for (i in index:length(direction)) { #rightwards, eliminate alien
    if(direction[i] == "" | direction[i] != player) {
      del_index_right = c(i:length(direction))
      break
    }
  }
  if (length(direction) == 1) {
    return(direction)
  }
  if (is.null(del_index_left) && is.null(del_index_right)) {
    return(direction)
  }
  if (!is.null(del_index_left) && is.null(del_index_right)) {
    return(direction[-del_index_left])
  } 
  if (is.null(del_index_left) && !is.null(del_index_right)) {
    return(direction[-del_index_right])
  }
  if (!is.null(del_index_left) && !is.null(del_index_right)) {
    return(direction[c(-del_index_left,-del_index_right)])
  }
}


count = function(board, player) {
  #returns a vector of continuous counts, 1:4 [int, int, int, int]
  counted = c(0, 0, 0, 0)
  
  for (row in 1:length(board[,1])) {
    for (col in 1:length(board[1,])) {
      #print(c(row, col))
      #in each direction, check continuous 4:1 
      if (board[row, col] != player) {next} #skip if not this player

      #print(board[row, ])
      #print(col)
      direction1 = extract_continue(as.vector(board[row, ]), col)
      #print(direction1)
      for (n in 4:1) {
        if (n.in.a.row(player, direction1, n)) {
          counted[n] = counted[n] + 1
          break
        }
      }

      #print(board[ ,col])
      #print(row)
      #print(col)
      #print(board)
      direction2 = extract_continue(as.vector(board[, col]), row)
      #print(direction2)
      for (n in 4:1) {
        if (n.in.a.row(player, direction2, n)) {
          counted[n] = counted[n] + 1
          break
        }
      }

      #print(get_diag(row, col, board))
      #print(col)
      direction3 = extract_continue(as.vector(get_diag(row, col, board)),
                                    min(row, col))
      #print(direction3)
      for (n in 4:1) {
        if (n.in.a.row(player, direction3, n)) {
          counted[n] = counted[n] + 1
          break
        }
      }

      #print(get_anti(row, col, board))
      #print(row)
      direction4 = extract_continue(as.vector(get_anti(row, col, board)),
                                    min(row, (length(board[1,])-col+1)))
      #print(direction4)
      for (n in 4:1) {
        if (n.in.a.row(player, direction4, n)) {
          counted[n] = counted[n] + 1
          break
        }
      }
    }
  }

  for(i in 1:4) {
    counted[i] = counted[i] / i
  }

  return(counted)
}
