require_relative '../model/deck'

module Utils

  def init_stack
    @card_stack = {}
    add_card_to_stack
    add_card_to_stack
  end

  def add_card_to_stack
    @cards ||= Deck.new.deck
    one_card_get(@cards).each { |key, value| @card_stack[key] = value }
  end

  def one_card_get(deck_hash)
    @card = {}
    deck_hash.sort { rand <=> rand }.each do |key, value|
      @card[key] = value
      deck_hash.delete(key)

      break if @card.size == 1
    end

    @card
  end

  def score
    @sum = 0
    @card_stack.each_value { |value| @sum = @sum + value }

    @sum
  end

  def bet(bet)
    @bank = @bank - bet
  end

  def minus_money(money)
    @bank = @bank - money
  end

  def plus_money(money)
    @bank = @bank + money
  end
end
