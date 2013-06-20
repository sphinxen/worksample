require "test_helper"

# Add the following to your Rake file to test routes by default:
#   MiniTest::Rails::Testing.default_tasks << "routes"

class RouteTest < ActionDispatch::IntegrationTest
  it "test home route" do
    assert_routing "/home/index", :controller => "home", :action => "index"
  end

  it "test add route" do
    assert_routing "/suppliers/new", :controller => "suppliers", :action => "new"
  end

  it "test edit route" do
    assert_routing "/suppliers/2/edit", :controller => "suppliers", :action => "edit", :id => "2"
  end
end
