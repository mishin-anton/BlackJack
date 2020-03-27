require_relative 'deck'
require_relative '../module/round'

class User
  attr_accessor :name, :bank, :cards_stack
  attr_reader :sum

  include Round

  def initialize (name)
    @name = name
    @bank = 0
    @cards_stack = {}
  end
end
