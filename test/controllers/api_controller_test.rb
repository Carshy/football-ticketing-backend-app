require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test 'should get v3' do
    get api_v3_url
    assert_response :success
  end

  test 'should get tickets' do
    get api_tickets_url
    assert_response :success
  end
end
