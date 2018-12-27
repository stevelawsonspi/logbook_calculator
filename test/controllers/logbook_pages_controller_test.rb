require 'test_helper'

class LogbookPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @logbook_page = logbook_pages(:one)
  end

  test "should get index" do
    get logbook_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_logbook_page_url
    assert_response :success
  end

  test "should create logbook_page" do
    assert_difference('LogbookPage.count') do
      post logbook_pages_url, params: { logbook_page: { logbook_id: @logbook_page.logbook_id, page_number: @logbook_page.page_number } }
    end

    assert_redirected_to logbook_page_url(LogbookPage.last)
  end

  test "should show logbook_page" do
    get logbook_page_url(@logbook_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_logbook_page_url(@logbook_page)
    assert_response :success
  end

  test "should update logbook_page" do
    patch logbook_page_url(@logbook_page), params: { logbook_page: { logbook_id: @logbook_page.logbook_id, page_number: @logbook_page.page_number } }
    assert_redirected_to logbook_page_url(@logbook_page)
  end

  test "should destroy logbook_page" do
    assert_difference('LogbookPage.count', -1) do
      delete logbook_page_url(@logbook_page)
    end

    assert_redirected_to logbook_pages_url
  end
end
