class CarsController < ApplicationController

  def create
    if !params.has_key?(:make) || params[:make].strip.empty? ||
       !params.has_key?(:model) || params[:model].strip.empty? ||
       !params.has_key?(:year) || params[:year].strip.empty?
       render "create.html.erb"

      #@car = "You screwed up try again you buffoon"
    else
      # create a car object with information submitted
      car = Car.new(params[:make], params[:model], params[:year], params[:carcolor])
      # save car object in session, so it can be accessed in the game
      session[:car] = car.to_yaml

      # rediect to the game play page
      redirect_to "/cars/status"
      #@car= "You created a car, thus you must not be a monkey"
    end
  end

    
    def status
      @car = YAML.load(session[:car])
    end

    def accelerate
      @car = YAML.load(session[:car])
      @car.accelerate
      session[:car] = @car.to_yaml
      render 'status'
    end

    def brake
      @car = YAML.load(session[:car])
      @car.brake
      session[:car] = @car.to_yaml
      render 'status'
    end

    def toggleLights
      @car = YAML.load(session[:car])
      @car.toggleLights
      session[:car] = @car.to_yaml
      render 'status'
    end

    def drift
      @car = YAML.load(session[:car])
      @car.drift(params[:driftLever])
      session[:car] = @car.to_yaml
      render 'status'
    end
end
