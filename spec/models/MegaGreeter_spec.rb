require 'spec_helper'

describe MegaGreeter do
  before(:all) { @mega_greeter = MegaGreeter.new(names: "Jane")}
  subject {@mega_greeter}
  it { should respond_to("say_hi") }
  it { should respond_to("say_bye") }

  it "should greet" do
    expect(@mega_greeter.greet_children(%w{Inky Pinky Clyde})).to eq("Hello Inky, Pinky, Clyde")
  end

  it "should upper case" do
    expect(@mega_greeter.upper_case("tiny tim")).to eq("TINY TIM")
    expect(@mega_greeter.upper_case("tiny tim")).to match(/[A-Z ]+/)
  end

  it "should mangle" do

  end

  context "Dealing with people" do
    let(:minor) { double("Person", :isAdult? => false, :name => "Tommy")}
    let(:adult) { double("Person", :isAdult? => true, :name => "Brown", :title => "Mrs.")}

    it "should greet minor" do
      expect(@mega_greeter.greet(minor)).to eq("Hello child Tommy")
    end

    it "should greet adult" do
      adult.should_receive(:isAdult?)
      expect(@mega_greeter.greet(adult)).to eq("Hello Mrs. Brown")
    end
  end


end
