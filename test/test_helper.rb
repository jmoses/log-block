require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'tempfile'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'log-block'

class Test::Unit::TestCase
  def last_line( file )
    file.rewind
    file.read.split("\n").last
  end
  
  def assert_last_line( file, message, level = 'DEBUG' )
    line = last_line(file)
    assert "#{level[0]}, \[#{Time.now.strftime('%Y-%m-%d')}#\d+\] #{level} -- : #{message}"
  end
end
