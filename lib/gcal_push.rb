require 'rubygems'
require 'hpricot'
require 'yaml'
#require 'lib/gdata/lib/gdata'

require File.join(File.dirname(__FILE__), "gcal_push", "base")
require File.join(File.dirname(__FILE__), "gcal_push", "calendar")
require File.join(File.dirname(__FILE__), "gcal_push", "event")

module TFT
  module GcalPush

    def self.included(base) 
      base.extend ActMethods 
    end 

    module ActMethods 
      def pushes_to_gcal( options={} )
        unless included_modules.include? InstanceMethods 
          cattr_accessor :options
          extend ClassMethods 
          include InstanceMethods 
        end# unless
        self.options = options
      end # pushes_to_gcal
    end # ActMethods

    module ClassMethods 
    end# ClassMethods

    module InstanceMethods 
      @calendar = nil

      ####################
      #push_to_calendar
      def push_to_calendar( calendar=nil )
        event = self
        calendar ||= options[:calendar]
        Base.new( options )
        Calendar.get_calendars.each { |c| @calendar = c if c.title == calendar }
        @calendar ||= Calendar.get_calendars.first
        Event.load( @calendar )
        Event.create( event )        
      end#push_to_calendar

      ####################
      #delete_from_calendar()
      def delete_from_calendar( calendar=nil )
        event = self
        calendar ||= options[:calendar]
        Base.new
        Calendar.get_calendars.each { |c| @calendar = c if c.title == calendar }
        Event.load( @calendar )
        to_be_del = Event.find_by_holiday_id( event.id )
        Event.delete( to_be_del )
      end#delete_from_calendar()
    end# InstanceMethods

  end# GCalPush
end# TFT