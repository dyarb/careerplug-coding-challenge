require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'creates a new comment via js' do
    assert_difference '@post.comments.count', 1 do
      post post_comments_url(@post), params: { comment: { name: 'Bob Thomas', body: 'I agree with everything in your post!'} }, xhr: true
    end

    assert_equal 'text/javascript', @response.media_type
  end

  test 'renders the edit template' do
    comment = comments(:one)

    get edit_post_comment_url(@post, comment)
    assert_response :success
  end

  test 'updates a comment successfully' do
    comment = comments(:one)
    new_body = 'This comment body has been edited.'

    patch post_comment_url(@post, comment), params: { comment: { name: 'New Name', body: new_body } }

    assert_equal comment.reload.body, new_body
    assert_redirected_to post_path(@post)
  end

  test 'destroys a post via js' do
    comment = comments(:one)

    assert_difference '@post.comments.count', -1 do
      delete post_comment_url(@post, comment), xhr: true
    end

    assert_equal 'text/javascript', @response.media_type
  end
end
