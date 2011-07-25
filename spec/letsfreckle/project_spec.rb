require 'spec_helper'

describe LetsFreckle::Project do
  context "#all" do
    it "should return all projects" do
      LetsFreckle.configure do
        username "username"
        account_host "host"
        token "secret"
      end

      stub_http_request(:get, LetsFreckle::Project.url('projects')).to_return(:body => load_response('projects'))
      projects = LetsFreckle::Project.all
      projects.size.should == 2

      first_project = projects.first
      first_project.name.should == 'TestProject1'
    end
  end
end