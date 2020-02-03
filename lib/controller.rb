require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
#démarrage de la page
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
#création de gossip
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    gossip_content = params["gossip_content"]
    gossip_author = params["gossip_author"]
    Gossip.new(gossip_content,gossip_author).save
    redirect '/'
  end
#afficher des potins unique
  get '/gossips/:id' do
    "GET /gossips/1" and "GET /gossips/2"
    params[':id'] = 1 || params[':id'] = 2 || params[':id'] = 3
    "Voici l'id du gossip demandé : #{params[':id']}"
  #  erb :show
  end

  # get '/hello/:name' do
  # "GET /hello/foo" and "GET /hello/bar"
  # params['name'] == 'foo' || params['name'] == 'bar'
  # "Hello #{params['name']}!"
  # end
end
