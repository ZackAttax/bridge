class SessionsController < ApplicationController


    get '/sessions/new' do
        
       erb :'sessions/new'
    end

    post '/sessions/new' do
        user = User.find_by(email: params["user"]["email"])
        if user&.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            redirect "/rides"
        else
            redirect "/sessions/new"
        end
    end

    delete '/logout' do 
        session.clear
        redirect "/login"
    end
end