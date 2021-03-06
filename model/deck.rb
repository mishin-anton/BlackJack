class Deck

  attr_reader :deck

  def initialize()
    @deck = { '1+' => 1, '1<3' => 1, '1^' => 1, '1<>' => 1,
             '2+' => 2, '2<3' => 2, '2^' => 2, '2<>' => 2,
             '3+' => 3, '3<3' => 3, '3^' => 3, '3<>' => 3,
             '4+' => 4, '4<3' => 4, '4^' => 4, '4<>' => 4,
             '5+' => 5, '5<3' => 5, '5^' => 5, '5<>' => 5,
             '6+' => 6, '6<3' => 6, '6^' => 6, '6<>' => 6,
             '7+' => 7, '7<3' => 7, '7^' => 7, '7<>' => 7,
             '8+' => 8, '8<3' => 8, '8^' => 8, '8<>' => 8,
             '9+' => 9, '9<3' => 9, '9^' => 9, '9<>' => 9,
             '10+' => 10, '10<3' => 10, '10^' => 10, '10<>' => 10,
             'V+' => 10, 'V<3' => 10, 'V^' => 10, 'V<>' => 10,
             'D+' => 10, 'D<3' => 10, 'D^' => 10, 'D<>' => 10,
             'K+' => 10, 'K<3' => 10, 'K^' => 10, 'K<>' => 10,
             'T+' => 11, 'T<3' => 11, 'T^' => 11, 'T<>' => 11 }
  end
end
