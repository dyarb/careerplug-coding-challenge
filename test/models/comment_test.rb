require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'default sort order is newest first' do
    comment_one = comments(:one)
    comment_two = comments(:two)

    assert_equal Comment.first, comment_two
  end
end
