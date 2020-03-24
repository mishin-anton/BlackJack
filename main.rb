require_relative 'model/user.rb'
require_relative 'model/dealer.rb'
require_relative 'model/deck.rb'
require_relative 'view/menu.rb'
require_relative 'view/game_field.rb'
require_relative 'module/results.rb'

include Results

@dealer_moved = 0

menu = Menu.new
menu.show_header
menu.show_prompt
@username = gets.chomp

@user = User.new(@username)
@dealer = Dealer.new
@game_field = GameField.new(@user, @dealer)

def dealer_move
  # - Пропустить ход (если очков у дилера 17 или более). Ход переходит игроку.
  # - Добавить карту (если очков менее 17).
  # У дилера появляется новая карта (для пользователя закрыта).
  # После этого ход переходит игроку. Может быть добавлена только одна карта.
  dealer_score = @dealer.score
  if dealer_score >= 17
    puts 'Dealer skipped'
    @dealer_moved = @dealer_moved + 1
    choose_action
  elsif dealer_score < 17
    @dealer.add_card_to_stack
    @game_field.update
    choose_action
  end
end

def choose_action
  puts 'Пропустить - 1, Добавить карту - 2, Открыть карты - 3'
  action = gets.chomp.to_i
  if action == 1 # skip
    dealer_move if @dealer_moved == 0
    return
  elsif action == 2 # add card
    @user.add_card_to_stack
    @game_field.update
    choose_action
  elsif action == 3 # open cards
  end
end

attempt = 1
while attempt != 0
  system ('reset')
  @dealer_moved = 0

  @user.init_stack
  @dealer.init_stack

  @game_field.show_game_field
  @game_field.start_game

  @user.bet(10)
  @dealer.bet(10)
  @game_field.show_bet
  choose_action

  calculate_results(@user, @dealer)
  @game_field.show_results

  puts "Another try? (1-Yes, 0-No)"
  attempt = gets.chomp.to_i
end
