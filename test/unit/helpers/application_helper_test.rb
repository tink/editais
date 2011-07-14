require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "limit to should return a string with ... when it achieves max chars" do
    result = limit_to('A string greater than 10 chars', 10)
    assert_equal 'A string g...', result
  end

  test "limit to should original string when it does not achieves max chars" do
    result = limit_to('A string smaller than 100 chars', 100)
    assert_equal 'A string smaller than 100 chars', result
  end
end
