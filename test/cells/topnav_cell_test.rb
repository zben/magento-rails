require 'test_helper'

class TopnavCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
