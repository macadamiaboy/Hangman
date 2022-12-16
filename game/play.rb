# frozen_string_literal: true

class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
  end

  def words
    [
      ["banana", "Well played!"],
      ["apple", "Well played!"],
      ["strawberry", "Well played!"],
      ["watermelon", "Well played!"],
      ["orange", "Well played!"]
    ]
  end

  def print_teaser
    word_teaser = ""

    @word.first.size.times do
      word_teaser += "_ "
    end

    puts word_teaser
  end

  def make_guess
    puts "Enter a letter"
    guess = gets.chomp

    good_guess = @word.first.include? guess

    if good_guess
      puts "Good guess!"
    else
      puts "Not correct!"
    end
  end

  def begin
    puts "A new game started! Your word is #{ @word.first.size } characters long"
    print_teaser

    puts "Clue: #{ @word.last }"

    make_guess
  end

end

game = Hangman.new
game.begin