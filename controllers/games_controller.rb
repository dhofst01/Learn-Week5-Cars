class GamesController < ApplicationController
  def play
    @result_string = params[:number].to_i.odd? ? "Odd" : "Even"
    @user = YAML.load(session[:user])
  end
end
