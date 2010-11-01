require 'test_helper'
require 'generators/powerux_multiselect_generator'

class PoweruxMultiselectGeneratorTest < Test::Unit::TestCase
  def setup
    @destination = File.join('tmp', 'test_app')
    @source = PoweruxMultiselectGenerator.source_root

    PoweruxMultiselectGenerator.start('', :destination_root => @destination)
  end

  def test_install
    assert File.exists?(
      File.join(@destination, 'public', 'javascripts', 'powerux-multiselect-rails.js')
    )

    assert_equal(
      File.read(File.join(@source, 'powerux-multiselect-rails.js')),
      File.read(File.join(@destination, 'public', 'javascripts', 'powerux-multiselect-rails.js'))
    )
  end
end

