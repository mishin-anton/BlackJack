class Menu
  def show_header
    system ('reset')
    puts '--------------------------------------------------------'
    puts '***   *       **    ***  *   *       *   **    *** *   *'
    puts '*  *  *       **   *     *  *        *   **   *    *  *'
    puts '***** *      ****  *     ***         *  ****  *    ***'
    puts '*   * *   * *    * *     *  *    *   * *    * *    *  *'
    puts '***** ***** *    *  ***  *   *   ***** *    *  *** *   *'
    puts '--------------------------------------------------------'
    puts "\n"
  end

  def show_prompt
    puts 'Enter player name: '
  end
end
