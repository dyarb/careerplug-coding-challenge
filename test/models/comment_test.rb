require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'default sort order is newest first' do
    comment_one = comments(:one)
    comment_two = comments(:two)

    assert_equal Comment.first, comment_two
  end

  test 'invalid without name' do
    comment = Comment.new(name: '', body: 'This is a comment body.')
    refute comment.valid?
    assert_not_nil comment.errors[:name]
  end

  test 'invalid without body' do
    comment = Comment.new(name: 'Billy Jean', body: '')
    refute comment.valid?
    assert_not_nil comment.errors[:body]
  end
end
