class SessionsController < ApplicationController


    get '/sessions/new' do
        redirect_if_logged_in
       erb :'sessions/new'
    end

    post '/sessions/new' do
        redirect_if_logged_in
        user = User.find_by(email: params["email"])
        if user&.authenticate(params["password"])
            session["user_id"] = user.id
            redirect "/rides"
        else
            "Error"
            sleep(5)
            redirect "/sessions/new"
        end
    end

    delete '/logout' do
        session.clear
        redirect "/sessions/new"
    end
end