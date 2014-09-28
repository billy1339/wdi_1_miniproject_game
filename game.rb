# Build a "character generator" using Ruby making use of the majority of topics above, especially classes, arrays/hashes, and methods. You may base your inspiration on any game, including
# For example (only an example, yours will vary), I may want to be able to create an object that is a Character, who is a Human Wizard named "Harry". The code should be flexible enough that I can also create an Elven Thief named "Locke" and have them both stored in memory.

# For all methods, you will comment 3 things: what the method does, the expected datatype/class of each input argument, and the expected datatype/class of the return value. If using a class, make note of where you're using 'self' (implied or explict) to refer to the instance of the class itself. For example

# 1. what the method does
#   2. the expected datatype/class of each input argument
#   3. the expected datatype/class of the return value


require 'pry'

heroes = {
  all_heroes: ["Knight", "Wizard", "Barbarian", "Samurai", "Wolverine", "Vampire", "Viking", "King", "Elf"],
  knight: {},
  wizard: {},
  barbarian: {},
  samurai: {},
  wolverine: {},
  vampire: {},
  viking: {},
  king: {},
  elf: {}
}
# .sample
# binding.pry
#each hero has some attibutes, chose three attributes, and one weakness


#this code will either add a new key to the hash or allow the player to pick from the existing list. input datatype: hash. output datatype: string
def pick_hero(heroes)
  puts "Welcome to the best game ever...first you must chose your hero"
  puts "There are some great heroes you can pick from...or you can make your own"
  puts heroes[:all_heroes]
  puts "\nif you want to use one of the pre-made heroes please enter their name, otherwise enter build"
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
# binding.pry

#this builds
class Attributes


  def initialize
    @stregnth = rand(1..10)
    @speed = rand(1..10)
    @wisdom = rand(1..10)
    @alertness = rand(1..10)
    @magic = rand(1..10)
    @health = rand(1..10)
  end

  def all_stats
    @all_stats = {stregnth: @stregnth, speed: @speed, wisdom: @wisdom, alertness: @alertness, magic: @magic, health: @health}
  end


  def add_em_up
    total = @stregnth + @speed + @wisdom +@alertness + @magic + @health
  end

end

# binding.pry
#this method stores the attributes of the hero into the origional hash with all the heroes. the input datatype is a hash, a class called Attributes, and a string. the output datatype is a hash.
def store_stats(heroes_hash, attribute_class, hero)
  heroes_hash[hero.to_sym] = attribute_class.all_stats
end


hero = pick_hero(heroes)
attributes_new = Attributes.new
store_stats(heroes, attributes_new, hero)
binding.pry



# puts "your hero is #{hero} and their total hitpoints are #{total_stats}"
# puts "would you like to see a breakdown of your hitpoints (y/n)"
# breakdown = gets.chomp
# if breakdown == "y"
# end


# binding.pry




#I want to try and place the random stats w/ name into a hash or a array, somewhere where they can all be listed
# binding.pry




# pick_hero(heroes)


# puts heroes
# binding.pry
#allow each player to pick their own attribute from the has of heroes, or make their own character



