require "test_helper"

class JournalItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journal_item = journal_items(:one)
  end

  test "should get index" do
    get journal_items_url
    assert_response :success
  end

  test "should get new" do
    get new_journal_item_url
    assert_response :success
  end

  test "should create journal_item" do
    assert_difference("JournalItem.count") do
      post journal_items_url, params: { journal_item: { body: @journal_item.body, published_at: @journal_item.published_at, title: @journal_item.title } }
    end

    assert_redirected_to journal_item_url(JournalItem.last)
  end

  test "should show journal_item" do
    get journal_item_url(@journal_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_journal_item_url(@journal_item)
    assert_response :success
  end

  test "should update journal_item" do
    patch journal_item_url(@journal_item), params: { journal_item: { body: @journal_item.body, published_at: @journal_item.published_at, title: @journal_item.title } }
    assert_redirected_to journal_item_url(@journal_item)
  end

  test "should destroy journal_item" do
    assert_difference("JournalItem.count", -1) do
      delete journal_item_url(@journal_item)
    end

    assert_redirected_to journal_items_url
  end
end
