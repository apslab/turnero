require 'test_helper'

class NumeratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_should_not_save_numerator_without_name
  	numerator = Numerator.new
  	assert !numerator.save
  end
end
