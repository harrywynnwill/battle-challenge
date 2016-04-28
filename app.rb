require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
#  enable :sessions
  get '/' do
    'Hello Battle!'
    erb :index
  end

  post '/names' do

    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)

   # $player_2 = "Jim" if $player_2 == nil


    redirect '/play'
  end

  get '/play' do
    @game =$game
    # @player_1 = $player_1
    # @player_2 = $player_2
    erb :play
  end

  get '/attack' do
    @game =$game
    # @player_1 = $player_1
    # @player_2 = $player_2
    # game = Game.new(@player1, @player2)
    @game.attack(@game.player2)
    @game.switch_turn
    erb :attack
  end

  run! if app_file == $0
end
