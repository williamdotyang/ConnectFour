cplayer = function(board, player) {
  opponent = ifelse(test=(player == "X"), yes="O", no="X")
  for (col in 1:7) { #search if there's a winning toss
    if(is.null(largest.empty.row(board, col))) {next}
    copy_board = board
    copy_board[largest.empty.row(board, col), col] = player
    vec_c_new = count(copy_board, player)
    if (vec_c_new[4] == 1) {
      index = c(largest.empty.row(board, col), col)
      return(index)
    }
  }
  
  for (col in 1:7) { #search if there's opponent's winning toss
    if(is.null(largest.empty.row(board, col))) {next}
    copy_board = board
    copy_board[largest.empty.row(board, col), col] = opponent
    vec_h_new = count(copy_board, opponent)
    if (vec_h_new[4] == 1) {
      index = c(largest.empty.row(board, col), col)
      return(index)
    }
  }
  
  vec_c = count(board, player) #count the current player priority
  vec_h = count(board, opponent) #count the current opponent priority
  delta_c_all = NULL #stores all possible priority changes for player
  delta_h_all = NULL #stores all possible priority changes for opponent
  
  for (col in 1:7) { #search all the possible tosses
    #print(col)
    if(is.null(largest.empty.row(board, col))) { #no largest empty row
      delta_c_all = c(delta_c_all, -1)
      delta_h_all = c(delta_h_all, -1)
      next
    }
    copy_board = board
    copy_board[largest.empty.row(board, col), col] = player
    #print(board)
    #print(copy_board)
    vec_c_next = count(copy_board, player) #count the next player priority
    delta_c = calc_delta(vec_c, vec_c_next) #calc the change in priority
    delta_c_all = c(delta_c_all, delta_c)
    copy_board = board
    copy_board[largest.empty.row(board, col), col] = opponent
    vec_h_next = count(copy_board, opponent) #count the next opponent priority
    delta_h = calc_delta(vec_h, vec_h_next) #calc the change in priority
    delta_h_all = c(delta_h_all, delta_h)
  }
  
  if (max(delta_c_all) > max(delta_h_all)) {
    index_col = which(delta_c_all == max(delta_c_all))
    print(index_col)
    #if (length(index_col) > 1) {
    #  break_tie(board, index_col, player)
    #}
    chosen_col = sample(c(index_col, index_col), size=1)
    chosen_row = largest.empty.row(board, chosen_col)
    index = c(chosen_row, chosen_col)
  } else {
    index_col = which(delta_h_all == max(delta_h_all))
    print(index_col)
    chosen_col = sample(c(index_col, index_col), size=1)
    chosen_row = largest.empty.row(board, chosen_col)
    index = c(chosen_row, chosen_col)
  }

  for (col in 1:7) { #if opponent will win in 2 steps, change index
    copy_board = board
    status1 = count(copy_board, opponent)
    copy_board[index[1], index[2]] = player
    copy_board[largest.empty.row(board, col), col] = opponent
    vec_h_new = count(copy_board, opponent)
    if (vec_h_new[4] == 1) {
      index = c(largest.empty.row(board, col), col)
      print(col)
      return(index)
    }
  }
  
  return(index)
}
