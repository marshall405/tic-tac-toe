$turn = 'X'
$game_over = false
$grid = [
    "_","_","_",
    "_","_","_",
    "_","_","_"
]
def draw_grid
    puts "
        | #{$grid[0]} | #{$grid[1]} | #{$grid[2]} |
        -------------
        | #{$grid[3]} | #{$grid[4]} | #{$grid[5]} |
        -------------
        | #{$grid[6]} | #{$grid[7]} | #{$grid[8]} |
    "
end

def switch_turns()
    if $turn == 'X'
        $turn = 'O'
    else 
        $turn = 'X'
    end
end

def check_for_win()
   if ($grid[0] == $turn && $grid[1] == $turn && $grid[2] == $turn) || 
      ($grid[0] == $turn && $grid[3] == $turn && $grid[6] == $turn) || 
      ($grid[0] == $turn && $grid[4] == $turn && $grid[8] == $turn) || 
      ($grid[3] == $turn && $grid[4] == $turn && $grid[5] == $turn) || 
      ($grid[1] == $turn && $grid[4] == $turn && $grid[7] == $turn) || 
      ($grid[6] == $turn && $grid[7] == $turn && $grid[8] == $turn) || 
      ($grid[2] == $turn && $grid[5] == $turn && $grid[8] == $turn) || 
      ($grid[6] == $turn && $grid[4] == $turn && $grid[2] == $turn) 
        $game_over = true
        draw_grid
        puts "Game over #{$turn} wins!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        play_again
   end
end

def add_turn_to_board(position)

    if ( ($grid[position] != 'X' && $grid[position] != "O") && (position <= 8 && position >= 0))
        $grid[position] = $turn
    else
        draw_grid
        puts "Invalid position, select a position between 1 - 9"
        pos = gets.chomp.to_i - 1
        add_turn_to_board pos
    end

end

def start_game()
    while !$game_over
        draw_grid
        puts "It is currently #{$turn}'s turn"
        puts "Select a position between [1 - 9]"
        pos = gets.chomp.to_i - 1
        add_turn_to_board pos

        check_for_win
        switch_turns

    end
end

def play_again()
    puts "Play again? (y)"
    $play_again = gets.chomp

    if $play_again == 'y'
        #reset global variables
        $turn = "X"
        $game_over = false
        $grid = [
            "_","_","3",
            "4","5","6",
            "7","8","9"
        ]
        start_game
    else
        puts "Bye!"
    end
end

start_game









