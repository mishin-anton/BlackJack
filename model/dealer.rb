require_relative 'deck'
require_relative '../module/round'

class Dealer
  attr_accessor :bank, :cards_stack
  attr_reader :sum

  include Round

  def initialize
    @bank = 0
    @cards_stack = {}
  end
end
