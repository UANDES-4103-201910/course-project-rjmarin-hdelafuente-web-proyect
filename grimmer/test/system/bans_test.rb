require "application_system_test_case"

class BansTest < ApplicationSystemTestCase
  setup do
    @ban = bans(:one)
  end

  test "visiting the index" do
    visit bans_url
    assert_selector "h1", text: "Bans"
  end

  test "creating a Ban" do
    visit bans_url
    click_on "New Ban"

    fill_in "User", with: @ban.user_id
    click_on "Create Ban"

    assert_text "Ban was successfully created"
    click_on "Back"
  end

  test "updating a Ban" do
    visit bans_url
    click_on "Edit", match: :first

    fill_in "User", with: @ban.user_id
    click_on "Update Ban"

    assert_text "Ban was successfully updated"
    click_on "Back"
  end

  test "destroying a Ban" do
    visit bans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ban was successfully destroyed"
  end
end
