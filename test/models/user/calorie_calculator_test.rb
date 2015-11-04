require 'test_helper'

class CalorieCalculatorTest < ActiveSupport::TestCase
  setup do
    @marion = users(:marion)
  end

  test 'remaining' do
    calorie_calculator = User::CalorieCalculator.new(@marion, Date.new(2015, 2, 2))
    assert_equal expected_calories, calorie_calculator.remaining
  end


  private

  def expected_calories
    1800 - 400 # target calories marion - enchiladas
  end
end
