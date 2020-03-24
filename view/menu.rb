require_relative '../model/user'

class Menu
  def show_header
    system ('reset')
    puts '--------------------------------------------------------'
    puts 'xxx   x       xx    xxx  x   x       x   xx    xxx x   x'
    puts 'x  x  x       xx   x     x  x        x   xx   x    x  x'
    puts 'xxxxx x      xxxx  x     xxx         x  xxxx  x    xxx'
    puts 'x   x x   x x    x x     x  x    x   x x    x x    x  x'
    puts 'xxxxx xxxxx x    x  xxx  x   x   xxxxx x    x  xxx x   x'
    puts '--------------------------------------------------------'
    puts "\n"
  end

  def show_prompt
    puts 'Enter player name: '
  end

  def show_action_menu(user)
    if user.card_stack.size == 2
      puts 'Пропустить - 1, Добавить карту - 2, Открыть карты - 3'
    else
      puts 'Пропустить - 1, Открыть карты - 3'
    end
  end
end
