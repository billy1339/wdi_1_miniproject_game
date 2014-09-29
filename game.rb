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

  #this method puts all the attributes into a hash. takes no inputs and output datatype is a hash
  def all_stats
    @all_stats = {stregnth: @stregnth, speed: @speed, wisdom: @wisdom, alertness: @alertness, magic: @magic, health: @health}
  end

  #this method adds up all the attributes to give hitpoints for the hero. it takes not inputs and returns a integer(fixnum)
  def add_em_up
    total = @stregnth + @speed + @wisdom +@alertness + @magic + @health
  end

end

# binding.pry
#this method stores the attributes of the hero into the origional hash with all the heroes. the input datatype is a hash, a class called Attributes, and a string. the output datatype is a hash.
def store_stats(heroes_hash, attribute_class, hero)
  heroes_hash[hero.to_sym] = attribute_class.all_stats
end

kryptonites = ["darnkness", "heat", "cold", "kryptonite", "spiders", "bats", "water", "heights"]


#this method assigns the hero a weakness and to add that weakness to the original hash along with the attributes. input datatypes are a hash, a string, and an array. output datatype is a string
def kryptonite(heroes_hash, hero, kryptonite_array)
  puts "Your hero has these amazing attributes, however every hero has a weakness...their very own Kryptonite!"
  puts "Your hero will be no different"
  hero = hero
  weakness = kryptonite_array.sample
  puts "#{hero}'s weakness is #{weakness}"
  heroes_hash[hero.to_sym][:weakness] = weakness
end



hero = pick_hero(heroes)
hero1 = hero.upcase
attributes_new = Attributes.new
puts "#{hero1} has these attributes listed below!"
puts attributes_new.all_stats
puts "#{hero1}'s total hitpoints are"
puts attributes_new.add_em_up
store_stats(heroes, attributes_new, hero)
kryptonite(heroes, hero, kryptonites)
# binding.pry


puts "Now that you've got your character made"
puts "its time to begin the journey...."


#this method does the first level of the game. input datatype is a string and a hash. output datatype is a boolean
def level_1(hero, heroes_hash)
  puts "Your jorney begins on the planet of Kazangee in the Manta system"
  puts "the transport ship is ready to take you to the inter-setellar ship orbiting Kazangee!"
  puts "Do you stay on planet...or leave Kazangee? (stay/leave)"
  input = gets.chomp
  if input == "leave"
    if heroes_hash[hero.to_sym][:weakness] == "heights"
      puts "Oh No! On the trip to the inter-setellar ship #{hero} died! #{hero}'s weakness was heights and died of fright when only a few hundred feet off the ground"
      exit
    else
      puts "bon-voyage!"
      return true
    end
  else
    return false
  end
end

# this method is the second level of the game. inputs are a string, a hash, and a boolean. outputs are a string or a boolean
def level2(hero, heroes_hash, level_1_boolean)
  if level_1_boolean == true
    puts "you've made it to the inter-setellar ship orbiting Kazangee. The capitain asks you where you want to go."
    puts " do you want to go to the ocean planet of Aquatarious or the cold and windy planet of Ventrisum"
    input = gets.chomp
    puts "the capitain likes your choice and will take you there immediately"
    hash_choices = input
  else
    puts "you're still on Kazangee and on your way home...you get lost and find yourself in a dark ally!"
    puts "suddenly you hear a scary voice say GIMME YOUR STUFF!"
    puts "#{hero} being the amazing hero they are says if you want it your going to have to take it from me!"
    puts "the two begin to fight"
    if heroes_hash[hero.to_sym][:weakness] == "darnkness"
      puts "your one weakness was the dark and the robber easily crushed you, took your stuff, and left you to die"
      exit
    else
      puts "You parry right, parry left, and then crack 'em straight in the chin knocking them on the ground"
      puts "you laugh at the criminals trivial attempt to rob you and continue on your way"
      return true
    end
  end
end

#this method outlines the third level of the game. inputs are a string, a hash, and either a boolean or a string
def level3(hero, heroes_hash, level_2_boolean)
  if level_2_boolean == true
    puts "you make it home after your confrentation with the robber, feeling happy and proud of yourself"
    puts "your feeling so great that you decide to go into the local dive bar called The Spiders Web"
    if heroes_hash[hero.to_sym][:weakness] == "spiders"
      puts "At the Spiders Web you find that there are actually Spiders serving the drinks and become frozen with fright!"
      puts "because the spiders never leave you are eternally frozen and die of starvation"
      exit
    end
  else
    puts "youve arrived at #{level_2_boolean} and the capitain drops you off"
    if level_2_boolean == "Aquatarious"
      if heroes_hash[hero.to_sym][:weakness] == "water"
        puts "you were dropped off in the ocean and drown because your weakness is water and you cant swim"
        exit
      end
    elsif level_2_boolean == "Ventrisum"
      if heroes_hash[hero.to_sym][:weakness] == "cold"
          puts "you were dropped in the cold and froze to death because your weakness is the cold"
          exit
      end

    end
    puts "you begin to explore the planet"
  end
end



lev_1 = level_1(hero, heroes)
lev_2 = level2(hero, heroes, lev_1)
level3(hero, heroes, lev_2)







