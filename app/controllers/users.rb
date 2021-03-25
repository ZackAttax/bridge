class UsersController < ApplicationController


    get '/users/new' do #render form
        redirect_if_logged_in
        erb :'/users/new'
    end

    post '/users/new' do #create user, go to home, or redirect to user/new
        redirect_if_logged_in
        user = User.new(name: params["name"], email: params["email"], password: params["password"], about: params["about"])
     if user.save
        session["user_id"] = user.id
        redirect "/rides"
     else 
        redirect '/users/new'
     end

    end

end