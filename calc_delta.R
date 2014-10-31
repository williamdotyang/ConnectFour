calc_delta = function(vec, vec_next) {
  #returns a vector of change in priority, 7 nums 
  delta = sum((vec_next - vec) * c(0.25, 2, 6, 18))
  return(delta)
}

break_tie = function(board, index_col, player) {
	vec_now = count(board, player)
	delta = NULL
	for (col in index_col) {
		copy_board = board
		copy_board[largest.empty.row(board), col] = player
		cplayer(copy_board, player)
	}
}
