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
  end
  
    
end