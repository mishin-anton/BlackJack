require_relative 'deck'

class User
  attr_accessor :name, :bank, :card_stack
  attr_reader :sum

  def initialize (name)
    @name = name
    @bank = 100
    @card_stack = {}
  end

  def init_stack
    @card_stack = {}
    add_card_to_stack
    add_card_to_stack
  end

  def add_card_to_stack
    one_card_get(Deck.new.deck).each { |key, value| @card_stack[key] = value }
  end

  def one_card_get(deck_hash)
    @card = {}
    deck_hash.sort { rand <=> rand }.each do |key, value|
      @card[key] = value

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
