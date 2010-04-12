require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'active_record'
require 'spec'

require File.dirname(__FILE__) + '/../rails/init.rb'

class Holiday < ActiveRecord::Base
  pushes_to_gcal
end
