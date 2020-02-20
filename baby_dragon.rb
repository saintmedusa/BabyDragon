class BabyDragon

  attr_reader :fullness_level, :quenched_level

  # color can be red, yellow or green
  # red exhales fire
  # yellow throws up
  # green dances

  def initialize(name, color)
    @name = name
    @is_asleep = false
    # The dragon is not hungry when @fullness_level is 10
    # The dragon is very hungry when @fullness_level is 0
    @fullness_level = 10
    @quenched_level = 10
    @color = color
    case @color
      when "red"
        @special_power = "#{@name} exhales fire."
      when "yellow"
        @special_power = "#{@name} throws up."
      when "green"
        @special_power = "#{@name} dances."
      else
        @special_power = "#{@name} wiggles its tail."
    end
  end

  def drink 
    puts "#{@name} laps water from a stone fountain." 

    @quenched_level = 10

    passage_of_time
  end

  def special_power
    puts @special_power
    passage_of_time
  end

  def eat
    puts "#{@name} eats popcorn, cheez-its, seaweed, cheetos, burritos"

    @fullness_level = 10

    passage_of_time
  end

  def play
    puts "#{@name} chills out next to the fireplace and eats a lot of salty snacks"

    passage_of_time
  end

  def takes_a_nap
    puts "#{@name} curls up and dozes off..."
    
    @is_asleep = true

    3.times do # both makes the dragon hungry and thirsty
      passage_of_time
    end

    @is_asleep = false

  end

  def passage_of_time
    if (@fullness_level > 0)
      @fullness_level -= 1
    else
      if (@is_asleep) 
        @is_asleep = false
        puts "#{@name} woke up!"
      end
      puts "#{@name} was super hangry! They ATE YOU! >:("
    end

    if (@quenched_level > 0)
      @quenched_level -= 1
    else 
      if (@is_asleep)
        @is_asleep = false
        puts "#{@name} woke up!"
      end
      puts "#{@name} has begun to cry!"
      puts "#{@name} was so sad that they drowned in their own tears :(."
      exit 
    end
  end

end

puff = BabyDragon.new("Puff The Magic Dragon", "red")

puff.drink
puff.eat
puff.play
puff.takes_a_nap
puff.eat

until (puff.quenched_level == 0 && puff.fullness_level == 0)
  puff.eat
  puff.special_power
end

until (puff.fullness_level == 0)
  puff.play
  puff.takes_a_nap
  puff.drink
end

