require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Program.new.valid?
  end
end
