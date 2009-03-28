#!/usr/bin/env ruby

require File.join( File.dirname(__FILE__), '..', 'lib', 'log_block.rb')

@logger = Logger.new( STDOUT )
@logger.debug("Trying something new")
@logger.with "-> " do |log|
  log.debug "First step"
  # Do something

  log.debug "Second step"

end
