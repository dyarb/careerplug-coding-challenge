require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'renders the index template' do
    post_one = posts(:one)
    post_two = posts(:two)

    get posts_url
    assert_select '.post', 2
  end

  test 'renders the show template' do
    post = posts(:one)

    get post_url(post)
    assert_select '#post-title', post.title
  end

  test 'renders the new template' do
    get new_post_url
    assert_response :success
  end

  test 'creates a new post successfully' do
    assert_difference 'Post.count', 1 do
      post posts_url, params: { post: { title: 'Create A Rails Blog', body: 'How to create your very own blog using Ruby on Rails!' } }
    end

    assert_redirected_to post_path(Post.first)
  end

  test 'renders the edit template' do
    post = posts(:one)

    get edit_post_url(post)
    assert_response :success
  end

  test 'updates a post successfully' do
    post = posts(:one)
    new_title = 'Edited Title'

    patch post_url(post), params: { post: { title: new_title, body: 'This post body has been edited.' } }

    assert_equal post.reload.title, new_title
    assert_redirected_to post_path(post)
  end

  test 'destroys a post via html' do
    post = posts(:one)

    assert_difference 'Post.count', -1 do
      delete post_url(post)
    end

    assert_redirected_to posts_path
  end

  test 'destroys a post via js' do
    post = posts(:one)

    assert_difference 'Post.count', -1 do
      delete post_url(post), xhr: true
    end

    assert_equal 'text/javascript', @response.media_type
  end
end
