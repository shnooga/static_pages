require 'spec_helper'

describe MegaGreeter do
  before { @mega_greeter = MegaGreeter.new(names: "Jane")}
  subject {@mega_greeter}
 it { should respond_to("say_hi") }

end
