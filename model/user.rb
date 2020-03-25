require_relative 'deck'
require_relative '../module/utils'

class User
  attr_accessor :name, :bank, :card_stack
  attr_reader :sum

  include Utils

  def initialize (name)
    @name = name
    @bank = 100
    @card_stack = {}
  end
end
