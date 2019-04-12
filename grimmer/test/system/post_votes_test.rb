require "application_system_test_case"

class PostVotesTest < ApplicationSystemTestCase
  setup do
    @post_vote = post_votes(:one)
  end

  test "visiting the index" do
    visit post_votes_url
    assert_selector "h1", text: "Post Votes"
  end

  test "creating a Post vote" do
    visit post_votes_url
    click_on "New Post Vote"

    fill_in "Post", with: @post_vote.post_id
    fill_in "User", with: @post_vote.user_id
    check "Vote" if @post_vote.vote
    click_on "Create Post vote"

    assert_text "Post vote was successfully created"
    click_on "Back"
  end

  test "updating a Post vote" do
    visit post_votes_url
    click_on "Edit", match: :first

    fill_in "Post", with: @post_vote.post_id
    fill_in "User", with: @post_vote.user_id
    check "Vote" if @post_vote.vote
    click_on "Update Post vote"

    assert_text "Post vote was successfully updated"
    click_on "Back"
  end

  test "destroying a Post vote" do
    visit post_votes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post vote was successfully destroyed"
  end
end
