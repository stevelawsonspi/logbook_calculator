require 'test_helper'

class LogbookEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @logbook_entry = logbook_entries(:one)
  end

  test "should get index" do
    get logbook_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_logbook_entry_url
    assert_response :success
  end

  test "should create logbook_entry" do
    assert_difference('LogbookEntry.count') do
      post logbook_entries_url, params: { logbook_entry: { day_minutes: @logbook_entry.day_minutes, logbook_page_id: @logbook_entry.logbook_page_id, night_minutes: @logbook_entry.night_minutes } }
    end

    assert_redirected_to logbook_entry_url(LogbookEntry.last)
  end

  test "should show logbook_entry" do
    get logbook_entry_url(@logbook_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_logbook_entry_url(@logbook_entry)
    assert_response :success
  end

  test "should update logbook_entry" do
    patch logbook_entry_url(@logbook_entry), params: { logbook_entry: { day_minutes: @logbook_entry.day_minutes, logbook_page_id: @logbook_entry.logbook_page_id, night_minutes: @logbook_entry.night_minutes } }
    assert_redirected_to logbook_entry_url(@logbook_entry)
  end

  test "should destroy logbook_entry" do
    assert_difference('LogbookEntry.count', -1) do
      delete logbook_entry_url(@logbook_entry)
    end

    assert_redirected_to logbook_entries_url
  end
end
