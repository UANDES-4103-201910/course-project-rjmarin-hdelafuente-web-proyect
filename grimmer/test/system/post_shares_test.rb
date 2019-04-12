require "application_system_test_case"

class PostSharesTest < ApplicationSystemTestCase
  setup do
    @post_share = post_shares(:one)
  end

  test "visiting the index" do
    visit post_shares_url
    assert_selector "h1", text: "Post Shares"
  end

  test "creating a Post share" do
    visit post_shares_url
    click_on "New Post Share"

    fill_in "Post", with: @post_share.post_id
    fill_in "User", with: @post_share.user_id
    click_on "Create Post share"

    assert_text "Post share was successfully created"
    click_on "Back"
  end

  test "updating a Post share" do
    visit post_shares_url
    click_on "Edit", match: :first

    fill_in "Post", with: @post_share.post_id
    fill_in "User", with: @post_share.user_id
    click_on "Update Post share"

    assert_text "Post share was successfully updated"
    click_on "Back"
  end

  test "destroying a Post share" do
    visit post_shares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post share was successfully destroyed"
  end
end
