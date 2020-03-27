require_relative 'model/user'

class Interface

  def initialize(user, dealer)
    @user = user
    @dealer = dealer
  end

  def username_set
    puts 'Enter player name'
    gets.chomp
  end

  def new_round
    puts "----------------------------"
    puts " Player name: #{@user.name}"
    puts " BANK:"
    puts " #{@user.name}: #{@user.bank}$  Dealer: #{@dealer.bank}$"
    puts "----------------------------"
  end

  def start_game
    puts "**start game***"
    puts " #{@user.name} cards: #{@user.cards_stack.keys} SUM: #{@user.score}"
    puts " Dealer cards * *"
  end

  def update
    puts " #{@user.name} cards: #{@user.cards_stack.keys} SUM: #{@user.score}"

    dealer_cards_quantyty = @dealer.cards_stack.size
    print " Dealer cards: "
    while dealer_cards_quantyty != 0
      print '* '
      dealer_cards_quantyty = dealer_cards_quantyty - 1
    end
    puts ''
  end

  def show_bet
    puts ' BET 10$'
  end

  def show_cards
    puts "#{@user.name} cards: #{@user.cards_stack.keys} SUM: #{@user.score}"
    puts "Dealer cards: #{@dealer.cards_stack.keys} SUM: #{@dealer.score}"
  end

  def show_bank
    puts "#{@user.name} bank: #{@user.bank}"
    puts "Dealer bank: #{@dealer.bank}"
  end

  def show_action_menu(user)
    if user.cards_stack.size == 2
      puts 'Пропустить - 1, Добавить карту - 2, Открыть карты - 3'
    else
      puts 'Пропустить - 1, Открыть карты - 3'
    end
  end

  def show_results
    puts 'RESULTS:'
    show_cards
    show_bank
  end
end
