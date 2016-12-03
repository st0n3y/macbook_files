require 'test_helper'

class CompletedTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get completed_tasks_index_url
    assert_response :success
  end

end
