require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'default sort order is newest first' do
    post_one = posts(:one)
    post_two = posts(:two)

    assert_equal Post.first, post_two
  end
end
