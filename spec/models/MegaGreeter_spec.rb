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

  it "should mangle" do

  end

  context "Dealing with people" do
    let(:minor) { double("Person", :isAdult? => false, :name => "Tommy")}
    let(:adult) { double("Person", :isAdult? => true, :name => "Brown", :title => "Mrs.")}

    it "should greet minor" do
      minor.should_receive(:isAdult?)
      @mega_greeter.greet(minor).should == "Hello child Tommy"
    end

    it "should greet adult" do
      adult.should_receive(:isAdult?)
      @mega_greeter.greet(adult).should == "Hello Mrs. Brown"
    end
  end


end
