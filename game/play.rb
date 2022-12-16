# frozen_string_literal: true

class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
    @lives = 7
    @letters_left = @word.size
  end

  def put_letters(letter, keyword, array)
    index = 0
    array.each do
      if keyword[index] == letter
        array[index] = "#{letter} "
        @letters_left -= 1
      end
      index += 1
    end
  end

  def print_teaser
    @word_performer = []

    @word.size.times do
      @word_performer << "_"
    end

    puts @word_performer
  end

  def make_guess
    if @letters_left == 0
      puts "You win!"
    elsif @lives > 0
      puts "Enter a letter"
      guess = gets.chomp

      if guess.size != 1
        puts "You should type only one letter"
        make_guess
      end

      if @word.include? guess
        put_letters(guess, @word, @word_performer)
        puts @word_performer
        make_guess
      else
        @lives -= 1
        puts "Not correct! #{ @lives } lives left"
        make_guess
      end
    else
      puts "You lost"
    end
  end

  def begin
    puts "A new game started! Your word is #{ @word.size } characters long"
    print_teaser

    make_guess
  end

  def words
    %w[banana apple strawberry watermelon orange]
  end

end

game = Hangman.new
game.begin