require_relative 'deck'
require_relative '../module/utils'

class Dealer
  attr_accessor :bank, :card_stack
  attr_reader :sum

  include Utils

  def initialize
    @bank = 100
    @card_stack = {}
  end
end
