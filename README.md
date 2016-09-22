ConnectFour
===========

##How to play:
Within an [R](https://cran.r-project.org) enviornment, run the script "hw3_extended.R".

===========
##About
Here's my solution of artificial intelligence on connect four game. The rule and further references are given in Wikipedia: http://en.wikipedia.org/wiki/Connect_Four . 

My solution is by no means a perfect one to this problem, but rather a intuition of how human(at least for the case of myself) might play this game and simulate its process by computer.

What I basically do is to construct a static function to evaluate the score for both sides of players given the current board. If there are more three-in-a-rows and two-in-a-rows, it’ll be more advantageous for the corresponding side, etc. So I do something like counting the number of continuous checks and map it into a score, indicating the "advantage" of one side. The “best move” is the one maximizes the change in advantage before and after the move. 

I tell the computer to play the "best move" for either side(computer or human), whichever is greater in change of advantage. Whenever there are several “best move”, I randomized the choices, but I can also recursively call the function and get the best for two-steps ahead, or more. Besides, I also added a few lines to prevent the opponent from winning in two steps ahead, which makes human a little harder to win. 

It has several shortcomings, however, as it puts an arbitrary weights on three-in-a-row(6 points) and two-in-a-row(2 points), and treats every n-in-a-row as the same regardless of the position. But in general, I think it well abstracts how human may think while playing the game.
