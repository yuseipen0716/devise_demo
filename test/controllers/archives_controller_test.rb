require "test_helper"

class ArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get archives_show_url
    assert_response :success
  end
end
