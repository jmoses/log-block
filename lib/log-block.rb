require 'logger'

module LogBlock
  module InstanceMethods
    def with( prefix, indent_size = 2 )
      yield get_block_logger( prefix, indent_size )
    end

    def get_block_logger( prefix, indent_size = 2)
      ::LogBlock::BlockLogger.new( self, prefix, indent_size )
    end    
  end

  class BlockLogger
    def initialize( logger, prefix, indent_size = 2 )
      @logger = logger
      @indent_size = indent_size
      @prefix = prefix
    end

    def method_missing( meth, *args )
      if [:debug, :info, :warn, :error, :fatal, :unknown].include?(meth)
        @logger.send(meth, message(args.first))
      else
        super
      end
    end

    def message( msg )
      "#{' ' * @indent_size}#{@prefix}#{msg}"
    end

  end

end

if defined?(Logger)
  Logger.send(:include, LogBlock::InstanceMethods)
end

if defined?(ActiveSupport) and defined?(ActiveSupport::BufferedLogger)
  ActiveSupport::BufferedLogger.send(:include, LogBlock::InstanceMethods)
end

