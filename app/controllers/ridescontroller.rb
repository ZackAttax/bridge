class RidesController < ApplicationController

    get '/rides' do
       
        redirect_if_not_logged_in
        @rides = Ride.all
        erb :'rides/index'
    end

    get '/rides/user' do
        redirect_if_not_logged_in
        @rides = current_user.rides
        if @rides != []
            erb :'rides/index'
        else
            "you have no rides"
            sleep(5)
            redirect "/rides/new"
        end

    end

    get '/rides/new' do
        redirect_if_not_logged_in

        erb :'/rides/new'
    end

    post '/rides/new' do
        redirect_if_not_logged_in
        ride = current_user.rides.build(params["ride"])
        
        if ride.save
        redirect "/rides/#{ride.id}"

        else
            "Error #{ride.errors.full_messages.join(", ")}"
            sleep(5)
            redirect "/rides/new"
        end
    end

    get '/rides/:id' do
        current_ride
        erb :'rides/show'
    end

    get '/rides/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        current_ride
        erb :'rides/edit'
    end

    patch '/rides/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        current_ride
        if @ride.update(params[:ride])
            redirect "/rides/#{@ride.id}"
        else
            "Error #{@ride.full_messages.join(", ")}"
            #redirect "/rides/edit/#{ride.id}"
        end
    end

    delete '/rides/:id/destroy' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        current_ride
        @ride.destroy
        redirect "/rides"
    end

    private

    def current_ride
        @ride ||= Ride.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
        current_ride
        if @ride.user_id != session["user_id"]
            redirect "/rides"
        end
    end

    def current_user_rides
        current_user.rides
    end

end