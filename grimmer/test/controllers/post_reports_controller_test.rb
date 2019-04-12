require 'test_helper'

class PostReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_report = post_reports(:one)
  end

  test "should get index" do
    get post_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_post_report_url
    assert_response :success
  end

  test "should create post_report" do
    assert_difference('PostReport.count') do
      post post_reports_url, params: { post_report: { comment_report: @post_report.comment_report, post_id: @post_report.post_id, user_id: @post_report.user_id } }
    end

    assert_redirected_to post_report_url(PostReport.last)
  end

  test "should show post_report" do
    get post_report_url(@post_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_report_url(@post_report)
    assert_response :success
  end

  test "should update post_report" do
    patch post_report_url(@post_report), params: { post_report: { comment_report: @post_report.comment_report, post_id: @post_report.post_id, user_id: @post_report.user_id } }
    assert_redirected_to post_report_url(@post_report)
  end

  test "should destroy post_report" do
    assert_difference('PostReport.count', -1) do
      delete post_report_url(@post_report)
    end

    assert_redirected_to post_reports_url
  end
end
