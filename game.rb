require_relative 'interface'
require_relative 'model/user'
require_relative 'model/dealer'
require_relative 'module/results.rb'

class Game
  include Results

  START_USER_BALANCE = 100
  START_DEALER_BALANCE = 100
  BET = 10

  attr_reader :user, :dealer, :dealer_moved

  def initialize
    @username = username_set
    @user = User.new(@username)
    @dealer = Dealer.new()
    @interface = Interface.new(@user, @dealer)
    @user.bank = START_USER_BALANCE
    @dealer.bank = START_DEALER_BALANCE
    @dealer_moved = 0
  end

  def controller
    attempt = 1
    round = 0

    while attempt != 0
      system ('reset')
      puts "Round #{round = round + 1}"

      @user.generate_cards
      @dealer.generate_cards

      @interface.new_round
      @interface.start_game

      @user.bet(BET)
      @dealer.bet(BET)
      @interface.show_bet
      choose_action

      calculate_results(@user, @dealer)
      @interface.show_results

      puts "Another try? (1-Yes, 0-No)"
      attempt = gets.chomp.to_i
    end
  end

  def username_set
    puts 'Enter player name'
    gets.chomp
  end

  def dealer_move
    return if @user.cards_stack.size >= 3 && @dealer.cards_stack.size >= 3

    dealer_score = @dealer.score
    if dealer_score >= 17
      puts 'Dealer skipped'
      @dealer_moved = @dealer_moved + 1
      choose_action
    elsif dealer_score < 17
      @dealer.add_card_to_stack
      @interface.update
      choose_action
    end
  end

  def choose_action
    @interface.show_action_menu(@user)
    action = gets.chomp.to_i
    if action == 1 # skip
      dealer_move if @dealer_moved == 0
      return
    elsif action == 2 # add card
      @user.add_card_to_stack
      @interface.update
      choose_action
    elsif action == 3 # open cards
    end
  end
end
