require 'rubygems'
require 'activesupport'
require 'test_helper'

class LogBlockTest < Test::Unit::TestCase
  context "using a default logger" do
    setup do
      @output = Tempfile.new("logblocktest")
      @logger = Logger.new( @output )
      @logger.datetime_format = "%Y-%m-%d"
    end
    
    should "not indent" do
      @logger.debug("Testing")
      assert_last_line @output, "Testing"
    end
    
    context "with one level" do
      setup do
        @block_logger = @logger.get_block_logger "Block:"
      end
      should "indent by one level" do
        @block_logger.debug("123Testing")
        assert_last_line @output, "  Block:123Testing"
      end
    end
    
    should "return a block logger for `with`" do
      @logger.with "Block" do |block_logger|
        block_logger.debug("In Block")
        assert_last_line @output, "  Block:In Block"
      end
    end
  end
  
  context "using a BufferedLogger" do
    setup do
      @output = Tempfile.new("logblocktest")
      @logger = ActiveSupport::BufferedLogger.new( @output )
      # @logger.datetime_format = "%Y-%m-%d"
    end
    
    should "respond to :with" do
      assert @logger.respond_to?(:with)
    end
    
    should "return a block logger for with" do
      @logger.with("Block") do |block_logger|
        block_logger.debug("In Block")
        assert_last_line @output, "  Block:In Block"        
      end
    end
    
    should "not indent" do
      @logger.debug("Testing")
      assert_last_line @output, "Testing"
    end
    
    context "with one level" do
      setup do
        @block_logger = @logger.get_block_logger "Block:"
      end
      
      should "indent by one level" do
        @block_logger.debug("123Testing")
        assert_last_line @output, "  Block:123Testing"
      end
    end
  end
    
end