require 'bundler'
require './idea'

Bundler.require

class IdeaBoxApp < Sinatra::Base
  
  set :method_override, true
  
  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end
  
  post '/' do
    #params.inspect
    #1. create an idea based on the form parameters
    idea = Idea.new(params['idea_title'], params['idea_description'])
    #2. Store it
    idea.save
    #3. Sending us back to the index page to see all ideas
    redirect '/'
  end
  
  delete '/:id' do |id|
    Idea.delete(id.to_i)
    redirect '/'
  end

end

class IdeaBoxApp < Sinatra::Base
  not_found do
    erb :error
  end

  # ...
end

class IdeaBoxApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  # ... other stuff
end