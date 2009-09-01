# Requirements
%w( rubygems sinatra grit haml sass ).each {|lib| require lib }

# Configuration
CONFIG = YAML::load(File.open('config.yml'))
REPO = Grit::Repo.new(CONFIG['repo_path']) || File.dirname(__FILE__)
BRANCH_NAMES = REPO.branches.map {|b| b.name}

# Before Filters
before do
  @repo = REPO
  @current_branch = params[:branch] || 'master'
  @branch_names = BRANCH_NAMES
end

# Index
get '/' do
  haml :index
end

# Details
get '/details/:commit_id' do
  @details = Rack::Utils.escape_html(@repo.commits(params[:commit_id]).first.to_patch).gsub(/\n/, '<br />')
  haml :details
end

# Stylesheet
get '/stylesheets/application.css' do
  content_type 'text/css'
  sass :'sass/application'
end
