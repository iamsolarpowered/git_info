require File.join(File.dirname(__FILE__), '..', 'git_info.rb')
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe 'Git Info' do

  it "should have a repo" do
    REPO.should_not be_nil
  end
  
  it "should list commits" do
    get '/'
    last_response.should be_ok
  end
  
  it "should show details" do
    get "/details/#{first_commit_id}"
    last_response.should be_ok
  end
  
  it "should have style" do
    get "/stylesheets/application.css"
    last_response.should be_ok
    last_response.headers['Content-Type'].should == 'text/css'
  end
  
  def first_commit_id
    REPO.commits.first.id
  end
  
end
