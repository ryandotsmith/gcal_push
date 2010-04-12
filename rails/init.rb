require File.dirname(__FILE__) + '/../lib/gcal_push'
ActiveRecord::Base.send :include, TFT::GcalPush 
