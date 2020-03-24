module Results
  def calculate_results(user, dealer)
  # Подсчет результатов:
  # - Выигрывает игрок, у которого сумма очков ближе к 21
  # - Если у игрока сумма очков больше 21, то он проиграл
  # - Если сумма очков у игрока и дилера одинаковая, то объявляется ничья и
  # деньги из банка возвращаются игрокам
  # - Сумма из банка игры переходит к выигравшему
  # После окончания игры, спрашиваем у пользователя, хочет ли он сыграть еще раз.
  # Если да, то игра начинается заново с раздачи карт, если нет - то завершаем работу.
    @user_score = user.score
    @dealer_score = dealer.score

    if @user_score > 21 && @dealer_score > 21
      puts 'TRY ATTEMPT'
      user.plus_money(10)
      dealer.plus_money(10)

    elsif @user_score > 21 && @dealer_score <= 21
      puts 'GAME OVER'
      dealer.plus_money(20)

    elsif @dealer_score > 21 && @user_score <= 21
      puts 'YOU WIN'
      user.plus_money(20)

    elsif @user_score == @dealer_score
      puts 'DRAW'
      user.plus_money(10)
      dealer.plus_money(10)

    else
      if (21 - @dealer_score) < (21 - @user_score)
        puts 'GAME OVER'
        dealer.plus_money(20)
      end

      if (21 - @user_score) < (21 - @dealer_score)
        puts 'YOU WIN'
        user.plus_money(20)
      end
    end
  end
end
