require "application_system_test_case"

class PostReportsTest < ApplicationSystemTestCase
  setup do
    @post_report = post_reports(:one)
  end

  test "visiting the index" do
    visit post_reports_url
    assert_selector "h1", text: "Post Reports"
  end

  test "creating a Post report" do
    visit post_reports_url
    click_on "New Post Report"

    fill_in "Comment report", with: @post_report.comment_report
    fill_in "Post", with: @post_report.post_id
    fill_in "User", with: @post_report.user_id
    click_on "Create Post report"

    assert_text "Post report was successfully created"
    click_on "Back"
  end

  test "updating a Post report" do
    visit post_reports_url
    click_on "Edit", match: :first

    fill_in "Comment report", with: @post_report.comment_report
    fill_in "Post", with: @post_report.post_id
    fill_in "User", with: @post_report.user_id
    click_on "Update Post report"

    assert_text "Post report was successfully updated"
    click_on "Back"
  end

  test "destroying a Post report" do
    visit post_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post report was successfully destroyed"
  end
end
