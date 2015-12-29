require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  setup do
    @entry = entries(:enchiladas)
  end

  test "set position" do
    new_entry = @entry.dup
    new_entry.save
    assert_equal 3, new_entry.position

    new_entry = @entry.dup
    new_entry.save
    assert_equal 4, new_entry.position
  end
end
