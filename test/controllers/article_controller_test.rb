require "test_helper"

class ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get article_show_url
    assert_response :success
  end
end
