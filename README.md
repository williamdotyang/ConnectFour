ConnectFour
===========

This is a course assignment of Stat 327 in UW-Madison. Here's my solution of artificial intelligence on connect four game. The rule and further references are given in Wikipedia: http://en.wikipedia.org/wiki/Connect_Four .

My solution is by no means a perfect solution to this problem, but rather a intuition of how human might play this game and simulate its process by computer.

---------------------------below is the breif explanations on the files---------------------

Lines 127~130 in file "hw3_extended.R" import functions for computer player.

"n_in_a_row.R" contains one function that is of the same spirit as four.in.a.row(), but generalized to n=2,3,4. 

"count.R" contains a function called count(), which scans the board and counts the continuous checks for either side player, returning a vector in to [int, int, int, int], indicating the number of continuous checks of one, two, three and four. count() has a helper function extract_continue().

 "calc_delta.R" has calc_delta() which takes the vectors returned by count(), and define a mapping from vectors to real numbers, which quantifies the effect of a particular move by comparing counts of boards before and after the move. Function break_tie() is defined but not used, because I decided to break the tie of equal-effect moves by randomness, for the simplicity.

 "cplayer.R" defines the function cplayer(), which will scan the board and evaluate the effect of each possible move for both sides and picks a best move for the given side of player. It also avoids the opponent's winning move in two steps ahead. 
