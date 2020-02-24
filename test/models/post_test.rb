require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'default sort order is newest first' do
    post_one = posts(:one)
    post_two = posts(:two)

    assert_equal Post.first, post_two
  end

  test 'invalid without title' do
    post = Post.new(title: '', body: 'This is a post body.')
    refute post.valid?
    assert_not_nil post.errors[:title]
  end

  test 'invalid without body' do
    post = Post.new(title: 'Post Title', body: '')
    refute post.valid?
    assert_not_nil post.errors[:body]
  end
end
