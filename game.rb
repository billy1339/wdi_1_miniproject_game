# Build a "character generator" using Ruby making use of the majority of topics above, especially classes, arrays/hashes, and methods. You may base your inspiration on any game, including
# For example (only an example, yours will vary), I may want to be able to create an object that is a Character, who is a Human Wizard named "Harry". The code should be flexible enough that I can also create an Elven Thief named "Locke" and have them both stored in memory.

# For all methods, you will comment 3 things: what the method does, the expected datatype/class of each input argument, and the expected datatype/class of the return value. If using a class, make note of where you're using 'self' (implied or explict) to refer to the instance of the class itself. For example


require 'pry'

heroes = {
  all_heroes: ["Knight", "Wizard", "Barbarian", "Samurai", "Wolverine", "Vampire", "Viking", "King", "Elf"],
  knight: [],
  wizard: [],
  barbarian: [],
  samurai: [],
  wolverine: [],
  vampire: [],
  viking: [],
  king: [],
  elf: []
}

# binding.pry
#each hero has some attibutes, chose three attributes, and one weakness
#this code will either add a new key to the hash or allow the player to pick from the existing list
def pick_hero(heroes)
  puts "Welcome to the best game ever...first you must chose your hero"
  puts "There are some great heroes you can pick from...or you can make your own"
  puts heroes[:all_heroes]
  puts "if you want to use one of the pre-made heroes please enter their name, otherwise enter build"
  hero = gets.chomp
  if hero == "build"
    puts "please enter the name of your character"
    new_hero = gets.chomp
    heroes[new_hero.to_sym] = []
    return new_hero.downcase
  else
    return hero.downcase
  end
end

class Attributes

  attr_accessor :stregnth, :speed, :wisdom, :alertness, :magic, :health

  def initialize
    @overall_stats = {}
  end

  def stats_stregnth
    @stregnth = rand(1..10)
  end

  def stats_speed
    @speed = rand(1..10)
  end

  def stats_wisdom
    @wisdom = rand(1..10)
  end

  def stats_alertness
    @alertness = rand(1..10)
  end

  def stats_magic
    @magic = rand(1..10)
  end

  def stats_health
    @health = rand(1..10)
  end

  def add_em_up
    total = stats_stregnth + stats_health + stats_magic + stats_alertness + stats_wisdom + stats_speed
  end

end


player = Attributes.new
something = player.add_em_up
puts something
# binding.pry




# pick_hero(heroes)


# puts heroes
# binding.pry
#allow each player to pick their own attribute from the has of heroes, or make their own character


# puts heroes
