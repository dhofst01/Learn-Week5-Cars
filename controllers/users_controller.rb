class UsersController < ApplicationController
  def index
 end

 def register
   if !params.has_key?(:given) || params[:given].strip.empty? ||
      !params.has_key?(:family) || params[:family].strip.empty?
     @name = "Name missing"
     render "register.html.erb"
   else
     # create a user object with information submitted
     user = User.new(params[:given], params[:family])
     # save user object in session, so it can be accessed in the game
     session[:user] = user.to_yaml
     # rediect to the game play page
     redirect_to "/games/play"
   end
 end
end
