require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    @cups.each.with_index do |cup, i|
      4.times { cup << :stone unless i == 6 || i == 13}
    end

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    game_cups = [0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12]
    raise "Invalid starting cup" unless game_cups.include?(start_pos)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
      #start_pos -= 1 if start_pos < 7
      hand = cups[start_pos].dup
      cups[start_pos] = []
      current_pos = start_pos

      if current_player_name == @name1 
        current_side = 1
      else
        current_side = 2
      end

      until hand.empty?
        #debugger
        current_pos += 1
        current_pos %= 14

        if current_side == 1
          cups[current_pos] << hand.shift unless current_pos == 13
        else
          cups[current_pos] << hand.shift unless current_pos == 6
        end
      end
      self.render
      self.next_turn(current_pos) 
  end

  def next_turn(ending_cup_idx)
    cup = cups[ending_cup_idx]
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cup == [:stone]
      :switch
    else
      ending_cup_idx
    end
  end


  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty? } || cups[7..12].all? {|cup| cup.empty? }
  end

  def winner
      case cups[6] <=> cups[13]
      when 0
        :draw
      when 1
        @name1
      when -1
        @name2
      end
  end
end
