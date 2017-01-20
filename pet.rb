class Pet
  attr_reader :health, :time, :hunger, :rest, :age, :happiness
  attr_accessor :name

  def initialize
    @health = 10
    @time = 10
    @hunger = 10
    @rest = 10
    @age = 0
    @happiness = 5
    @volosatost1 = 3
  end

  def help
    puts "Allowed commands:\nfeed, rest, play, stab, kill(?), walk, stat"
  end

  def status
    puts 'Health ' + @health.to_s
    puts 'Hunger ' + @hunger.to_s
    puts 'Sleep ' + @rest.to_s
    if @happiness <= 0 
      puts 'Your pet hates your guts.' + ' Happiness ' + @happiness.to_s
      else puts 'Happiness ' + @happiness.to_s
    end
    puts 'Age ' + @age.to_s + ' days'
    if @volosatost1.zero?
      puts 'Your pet is fucking bold'
    elsif @volosatost1 >= 10
      puts 'Your pet has too much hair, if u didn`t do something he will eat it'
    end
  end

  def stab
    puts 'You have stabbed your pet with a knife. Why would you do that?'
    hurt
    time_pass(1, 1)
  end

  def feed
    @health += 2 if @health < 9
    @hunger += 2
    @happiness += 1
    @volosatost1 += 1
    time_pass(1, 2)
    overfed if @hunger >= 10
    hurt if @volosatost1 >= 10
  end

  def rest # time_pass looping me
    puts 'Your pet fell asleep'
    @hunger -= 2
    @happiness -= 2
    @time -= 3
    @rest += 2
    @volosatost1 += 1
    # time_pass(3, 0)
    day_pass if @time <= 0
    hurt if @volosatost1 >= 10
    hurt if @hunger <= 0
    random
  end

  def play
    puts 'You decided to waste some time with your pet playing some games'
    @hunger -= 2
    @happiness += 3
    @volosatost1 += 1
    time_pass(3, 3)
  end

  def kill
    death
  end

  def walk
    puts 'You have took your pet for a walk and wasted some time'
    @hunger -= 2
    @happiness += 1
    @volosatost1 += 1
    time_pass(3, 3)
  end

  protected

  def time_pass(t, s)
    @time -= t
    @rest -= s
    rest if @rest <= 0
    day_pass if @time <= 0
    hurt if @hunger <= 0
    hurt if @volosatost1 >= 10
  end

  def day_pass
    puts "A day have passed by. #{name} greets you"
    @time = 10
    @age += 1
    death if @health <= 0
    rest if @rest <= 0
  end

  def overfed
    puts "#{name} eaten too much, he is sick for now"
    hurt
    @hunger = 10
  end

  def hurt
    @health -= 3
    @happiness -= 3
    death if @health <= 0
  end

  def death
    abort("#{name} is dead.")
  end

  def cut
    @volosatost1 -= 3
  end

  def random
    x = rand(1000)
    if x < 1 then puts 'Unlucky your pet died. He got a heart attack'; death
    elsif x < 10 then puts 'You have found the Gates of Hell,
      the mood got better'; @happiness += 10
    elsif x < 100 then puts 'Your pet had a good dream'; @happiness += 2
    elsif x < 200 then puts 'You forgot to close the window and
      your pet catch a cold'; hurt
    elsif x < 300 then puts 'Your pet found and eaten some drugs hidden in
       the stash, he is too hairy for now'; @volosatost1 += 10
    end
  end
end

petik = Pet.new
puts 'Enter your pet`s name'
petik.name = gets.chomp
puts "Nice, now u can play with your cute little pet named #{petik.name}"
puts "You can now use 'help' for the list of commands"
loop do
  i = gets.chomp
  case i
  when 'feed'   then petik.feed
  when 'stab'   then petik.stab
  when 'status' then petik.status
  when 'rest'   then petik.rest
  when 'walk'   then petik.walk
  when 'play'   then petik.play
  when 'kill'   then petik.kill
  when 'help'   then petik.help
  when 'cut'    then petik.cut
  else puts "Wrong input. Try typing with lower case or enter 'help' for help"
  end
end
