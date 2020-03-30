require_relative 'interface'
require_relative 'model/user'
require_relative 'model/dealer'

class Game
  START_USER_BALANCE = 100
  START_DEALER_BALANCE = 100
  BET = 10

  attr_reader :user, :dealer, :dealer_moved

  def initialize
    @interface = Interface.new
    @user = User.new(@interface.username_set)
    @dealer = Dealer.new
    @user.bank = START_USER_BALANCE
    @dealer.bank = START_DEALER_BALANCE
    @dealer_moved = 0
  end

  def controller
    attempt = 1
    round = 0

    while attempt != 0
      system ('reset')
      @interface.show_round_info(round = round + 1)

      @user.generate_cards
      @dealer.generate_cards

      @interface.new_round(@user, @dealer)
      @interface.start_game(@user)

      @user.bet(BET)
      @dealer.bet(BET)
      @interface.show_bet
      choose_action

      calculate_results(@user, @dealer)
      @interface.show_results(@user, @dealer)

      @interface.dialog_another_try?
      attempt = gets.chomp.to_i
    end
  end

  def dealer_move
    return if @user.cards_stack.size >= 3 && @dealer.cards_stack.size >= 3

    dealer_score = @dealer.score
    if dealer_score >= 17
      @interface.message('Dealer skipped')
      @dealer_moved = @dealer_moved + 1
      choose_action
    elsif dealer_score < 17
      @dealer.add_card_to_stack
      @interface.update(@user, @dealer)
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
      @interface.update(@user, @dealer)
      choose_action
    elsif action == 3 # open cards
    end
  end

  def calculate_results(user, dealer)
    @user_score = user.score
    @dealer_score = dealer.score

    if @user_score > 21 && @dealer_score > 21
      @interface.message('TRY ATTEMPT')
      user.plus_money(10)
      dealer.plus_money(10)

    elsif @user_score > 21 && @dealer_score <= 21
      @interface.message('GAME OVER')
      dealer.plus_money(20)

    elsif @dealer_score > 21 && @user_score <= 21
      @interface.message('YOU WIN')
      user.plus_money(20)

    elsif @user_score == @dealer_score
      @interface.message('DRAW')
      user.plus_money(10)
      dealer.plus_money(10)

    else
      if (21 - @dealer_score) < (21 - @user_score)
        @interface.message('GAME OVER')
        dealer.plus_money(20)
      end

      if (21 - @user_score) < (21 - @dealer_score)
        @interface.message('YOU WIN')
        user.plus_money(20)
      end
    end
  end
end
