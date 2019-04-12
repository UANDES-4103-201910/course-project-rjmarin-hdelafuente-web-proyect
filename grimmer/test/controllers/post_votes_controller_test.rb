require 'test_helper'

class PostVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_vote = post_votes(:one)
  end

  test "should get index" do
    get post_votes_url
    assert_response :success
  end

  test "should get new" do
    get new_post_vote_url
    assert_response :success
  end

  test "should create post_vote" do
    assert_difference('PostVote.count') do
      post post_votes_url, params: { post_vote: { post_id: @post_vote.post_id, user_id: @post_vote.user_id, vote: @post_vote.vote } }
    end

    assert_redirected_to post_vote_url(PostVote.last)
  end

  test "should show post_vote" do
    get post_vote_url(@post_vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_vote_url(@post_vote)
    assert_response :success
  end

  test "should update post_vote" do
    patch post_vote_url(@post_vote), params: { post_vote: { post_id: @post_vote.post_id, user_id: @post_vote.user_id, vote: @post_vote.vote } }
    assert_redirected_to post_vote_url(@post_vote)
  end

  test "should destroy post_vote" do
    assert_difference('PostVote.count', -1) do
      delete post_vote_url(@post_vote)
    end

    assert_redirected_to post_votes_url
  end
end
