class Game
  TOTAL_ERRORS_ALLOWED = 7
  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    @user_guesses - @letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result = @letters.map do |letter|
      if @user_guesses.include?(letter)
        letter
      else
        nil
      end
    end
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(letter)
      @user_guesses << letter
    end
  end

  def word
    @letters.join
  end

  def won?
    (@letters - @user_guesses).empty?
  end

  def lost?
    errors_allowed.zero?
  end
end
