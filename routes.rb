Rails.application.routes.draw do
 # Play the game after user has registered
  get 'games/play'
  get 'cars/create'
  get 'cars/status'
  get 'cars/toggleLights'
  get 'cars/drift'
  get 'cars/accelerate'
    get 'cars/brake'
  # Show the index page
  get '/users/index'
  # Run the register method and show the register page.
  get '/users/register'
end
