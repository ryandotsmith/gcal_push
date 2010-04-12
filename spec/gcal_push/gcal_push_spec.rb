require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "initializing a new Gcal_Push::Base object" do


  it "should use the yaml config file" do
    TFT::GcalPush::Base.new
    TFT::GcalPush::Base.gcal_push_config.should_not eql( nil )
  end
  
  it "should set up a new gdata calendar object" do
    GData::Client::Calendar.should_receive(:new).once
    TFT::GcalPush::Base.new
  end


end


