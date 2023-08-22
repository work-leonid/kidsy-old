require "application_system_test_case"

class JournalItemsTest < ApplicationSystemTestCase
  setup do
    @journal_item = journal_items(:one)
  end

  test "visiting the index" do
    visit journal_items_url
    assert_selector "h1", text: "Journal items"
  end

  test "should create journal item" do
    visit journal_items_url
    click_on "New journal item"

    fill_in "Body", with: @journal_item.body
    fill_in "Published at", with: @journal_item.published_at
    fill_in "Title", with: @journal_item.title
    click_on "Create Journal item"

    assert_text "Journal item was successfully created"
    click_on "Back"
  end

  test "should update Journal item" do
    visit journal_item_url(@journal_item)
    click_on "Edit this journal item", match: :first

    fill_in "Body", with: @journal_item.body
    fill_in "Published at", with: @journal_item.published_at
    fill_in "Title", with: @journal_item.title
    click_on "Update Journal item"

    assert_text "Journal item was successfully updated"
    click_on "Back"
  end

  test "should destroy Journal item" do
    visit journal_item_url(@journal_item)
    click_on "Destroy this journal item", match: :first

    assert_text "Journal item was successfully destroyed"
  end
end
