require File.expand_path('../../spec_helper', __FILE__)

describe "The || operator" do
  it "evaluates to true if any of its operands are true" do
    if false || true || nil
      x = true
    end
    x.should == true
  end

  it "evaluates to false if all of its operands are false" do
    if false || nil
      x = true
    end
    x.should == nil
  end

  it "is evaluated before assignment operators" do
    x = nil || true
    x.should == true
  end

  it "has a lower precedence than the && operator" do
    x = 1 || false && x = 2
    x.should == 1
  end

  it "treats empty expressions as nil" do
    (() || true).should == true
    (() || false).should == false
    (true || ()).should == true
    (false || ()).should == nil
    (() || ()).should == nil
  end

  it "has a higher precedence than 'break' in 'break true || false'" do
    lambda { break false || true }.call.should == true
  end
end

describe "The or operator" do
  it "evaluates to true if any of its operands are true" do
    x = nil
    if false or true
      x = true
    end
    x.should == true
  end

  it "is evaluated after variables are assigned" do
    x = nil or true
    x.should == nil
  end

  it "has a lower precedence than the || operator" do
    x = y = nil
    x = true || false or y = 1
    y.should == nil
  end

  it "treats empty expressions as nil" do
    (() or true).should == true
    (() or false).should == false
    (true or ()).should == true
    (false or ()).should == nil
    (() or ()).should == nil
  end
end

