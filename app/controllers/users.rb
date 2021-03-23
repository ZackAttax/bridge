class UsersController < ApplicationController


    get '/users/new' do #render form
        erb :'/users/new'
    end

    post '/users/new' do #create user, go to home, or redirect to user/new
        @user = User.new(name: params["name"], email: params["email"], password: params["password"], about: params["about"])
        #binding.pry
     if @user.save
        session["user_id"] = @user.id
        redirect "/rides"
     else 
        redirect '/users/new'
     end

    end

end