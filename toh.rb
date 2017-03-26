# Welcome to Tower of Hanoi!
# Instructions:
# Enter where you'd like to move from and to
# in the format '1,3'. Enter 'q' to quit.

def finish_game(rods, num_rings, game_on)
  if (1..num_rings).to_a == rods[1] or (1..num_rings).to_a == rods[2]
    puts "You win"
    game_on = false
  elsif
  puts game_on
  end
end

def render(rods, num_rings)
  board_output_string = "            "
  puts "Current Board:"
  (0..(num_rings-1)).to_a.each do |line|
    tile_size = rods[0][line]
    unless tile_size == 0
      char_offset = 0
      tile_size.times do
        board_output_string[char_offset] = "O"
        char_offset += 1
      end
    end

    tile_size = rods[1][line]
    unless tile_size == 0
      char_offset = 4
      tile_size.times do
        board_output_string[char_offset] = "O"
        char_offset += 1
      end
    end

    tile_size = rods[2][line]
    unless tile_size == 0
      char_offset = 9
      tile_size.times do
        board_output_string[char_offset] = "O"
        char_offset += 1
      end
    end
    puts board_output_string
  end
  puts "1   2    3"
end

def valid_move?
  #move must be either 1,2, or 3
  #cannot move from empty rods
  #
end


def make_move(rods, move)
  if move == "q"
    exit
  end
  move_a = move.split(",").to_a
  rod_begin = move_a[0].to_i - 1
  rod_begin_index = 0
  rod_end = move_a[1].to_i - 1
  rod_end_index = 0
  #if incorect_input?
  #puts "Please reenter"
  #else
  (0..(rods[0].length - 1)).to_a.each do |index|
    if rods[rod_begin][index] > 0
      rod_begin_index = index
      break
    end
  end
  (0..(rods[0].length - 1)).to_a.reverse.each do |index|
    if rods[rod_end][index] == 0
      rod_end_index = index
      break
    end
  end
  #logical tests
  rods[rod_begin][rod_begin_index], rods[rod_end][rod_end_index] = rods[rod_end][rod_end_index], rods[rod_begin][rod_begin_index]
#  puts "Moving from rod #{rod_begin},#{rod_begin_index} to rod #{rod_end}, #{rod_end_index}"
  render(rods, num_rings)
  #end
end


def play num_rings = 3
  puts "Welcome to Tower of Hanoi!"
  puts "Instructions:"
  puts "Enter where you'd like to move from and to"
  puts "in the format '1,3'. Enter 'q' to quit."
  puts
  puts "First enter the number of rings you'd like to play with"
  #initializes main variables
  num_rings = gets.chomp.to_i
  rods = [(1..num_rings).to_a, [], []]
  num_rings.times do
    rods[1] << 0
    rods[2] << 0
  end
  move = ""
  game_on = true
  render(rods, num_rings)
  while game_on == true
    move = gets.chomp
  #  move = "1,2"
    make_move(rods, move)
  #  render(rods, num_rings)
    finish_game(rods, num_rings, game_on)
  end
  exit
end

play 3
