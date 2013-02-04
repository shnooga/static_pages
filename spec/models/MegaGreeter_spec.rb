require 'spec_helper'

describe MegaGreeter do
  before(:all) { @mega_greeter = MegaGreeter.new(names: "Jane")}
  subject {@mega_greeter}
  it { should respond_to("say_hi") }

  it "should greet" do
    puts @mega_greeter
    @mega_greeter.greet_children(%w{Inky Pinky Clyde}).should == "Hello Inky, Pinky, Clyde"
  end

  it "should upper case" do
    @mega_greeter.upper_case("tiny tim").should == "TINY TIM"
  end
end
