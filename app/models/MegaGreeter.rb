class MegaGreeter
attr_accessor :names
  def initialize(names = "World")
    @names = names
  end
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list, iterate!
      @names.each do |name|
      puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}"
    end
  end

  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      puts "Goodbye #{@names.join(", ")}. Come back soon!"
    else
      puts "Goodbye #{@names}. Come back soon!"
    end
  end

  def upper_case(txt)
    txt.upcase!
  end

  def greet_children(*children_names)
    "Hello #{children_names.join(', ')}"
  end

  def mangle(*args)
    upper_case(greet_children(args))
  end

  def greet(person)
    msg = "Hello #{person.isAdult? ? person.title : 'child'} #{person.name}"
    p msg
  end
end

class Person
  attr_accessor :name, :age, :title

  def initialize(title, name, age)
    @title = title
    @name = name
    @age = age
  end

  def isAdult?
    return age > 17
  end
end

if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  mg.names = "Fred"
  mg.say_hi
  mg.say_bye

  mg.names = ["Fred", "wilma", "Barney"]
  mg.names = %w( Joe Frank Bob)
  mg.say_hi
  mg.say_bye

  puts mg.greet_children(%w{Jane Bob Zach})
  p mg.mangle %w{Tom Dick Harry}

  minor = Person.new("Mr.", "Huckleberry", 14)
  mg.greet(minor)
end
