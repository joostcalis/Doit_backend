require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe TasksController do
  render_views # <-- You need this to test your json response!

  it "should render in json successfully" do
    get :index, :format => :json
    it  is_expected.to be succes 

  end

#   it "should fail when code is not present" do
#   	get 'some_endpoint', :format => :json
#   	response.should be_success
#
#   	# Parse json response
#   	body = JSON.parse(response.body)
#
#   	# Test the json structure
#   	body.should include('status')
#   	status = body['status']
#   	status.should include('code')
#   	status.should include('message')
#   	status.should include('endpoint')
#
#   	# Test the response values
#   	status['code'].should eq(600)
#   	status['message'].should eq('Code is required')
#   end
# end
end
end
