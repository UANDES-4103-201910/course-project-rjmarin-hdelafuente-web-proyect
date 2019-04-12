require 'test_helper'

class PostSharesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_share = post_shares(:one)
  end

  test "should get index" do
    get post_shares_url
    assert_response :success
  end

  test "should get new" do
    get new_post_share_url
    assert_response :success
  end

  test "should create post_share" do
    assert_difference('PostShare.count') do
      post post_shares_url, params: { post_share: { post_id: @post_share.post_id, user_id: @post_share.user_id } }
    end

    assert_redirected_to post_share_url(PostShare.last)
  end

  test "should show post_share" do
    get post_share_url(@post_share)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_share_url(@post_share)
    assert_response :success
  end

  test "should update post_share" do
    patch post_share_url(@post_share), params: { post_share: { post_id: @post_share.post_id, user_id: @post_share.user_id } }
    assert_redirected_to post_share_url(@post_share)
  end

  test "should destroy post_share" do
    assert_difference('PostShare.count', -1) do
      delete post_share_url(@post_share)
    end

    assert_redirected_to post_shares_url
  end
end
