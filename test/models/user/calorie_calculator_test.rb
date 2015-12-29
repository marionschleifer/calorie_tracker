require 'test_helper'

class CalorieCalculatorTest < ActiveSupport::TestCase
  setup do
    @marion = users(:marion)
  end

  test 'remaining' do
    calorie_calculator = User::CalorieCalculator.new(@marion, Date.today)
    assert_equal expected_calories, calorie_calculator.daily_calories
  end


  private

  def expected_calories
    400 # enchiladas
  end
end
