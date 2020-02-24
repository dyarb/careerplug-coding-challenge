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

  test 'search posts by title' do
    post_one = posts(:one)
    post_two = posts(:two)
    post_three = Post.create(title: 'Find me by my title', body: 'This is a post body.')

    assert_equal Post.by_term('Find me').first, post_three
  end

  test 'search posts by body' do
    post_one = posts(:one)
    post_two = posts(:two)
    post_three = Post.create(title: 'Post Title', body: 'Find me by the content of my post.')

    assert_equal Post.by_term('Find me').first, post_three
  end
end
