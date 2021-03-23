class RidesController < ApplicationController

    get '/rides' do
        "Rides"
    end

    get '/rides/new' do
       erb :'/rides/new'
    end

    post '/rides/new' do
        binding.pry
        @ride = Ride.create(params["ride"])
        redirect '/rides/all'
    end

    get '/rides/:id/edit' do
        @ride = Ride.find_by_id(params[:id])
        erb :'rides/edit'
    end

    patch '/rides/'

end