# Build a "character generator" using Ruby making use of the majority of topics above, especially classes, arrays/hashes, and methods. You may base your inspiration on any game, including
# For example (only an example, yours will vary), I may want to be able to create an object that is a Character, who is a Human Wizard named "Harry". The code should be flexible enough that I can also create an Elven Thief named "Locke" and have them both stored in memory.

# For all methods, you will comment 3 things: what the method does, the expected datatype/class of each input argument, and the expected datatype/class of the return value. If using a class, make note of where you're using 'self' (implied or explict) to refer to the instance of the class itself. For example


require 'pry'

heroes = {
  all_heroes: ["Knight", "Wizard", "Barbarian", "Samurai", "Wolverine", "Vampire", "Viking", "King", "Elf"],
  knight: [1,2,3],
  wizard: [1,2,3],
  barbarian: [1,2,3],
  samurai: [1,2,3],
  wolverine: [1,2,3],
  vampire: [1,2,3],
  viking: [1,2,3],
  king: [1,2,3],
  elf: [1,2,3]
}

# binding.pry
#each hero has some attibutes, chose three attributes, and one weakness
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
  else
    player_hero = heroes[hero.to_sym]
  end

end

pick_hero(heroes)

binding.pry
#allow each player to pick their own attribute from the has of heroes, or make their own character


# puts heroes
