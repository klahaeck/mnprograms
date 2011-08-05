require 'test_helper'

class WorksTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Works.new.valid?
  end
end
