class SessionsController < ApplicationController

  def new
  end

  # If the user successfully authenticates with email/password, then
  # the client will receive the user auth token back
  def create
  	user = User.find_by(email: params[:session][:email])

  	if user && user.authenticate(params[:session][:password])
  		render text: user.auth_token, status: 200
		else
			render text: "Invalid email or password", status: 422
		end	
  end

  # Determines whether the received auth token actually matches a user
  # and thus is valid
  def verify_access_token
  	user = User.find_by(auth_token: params[:session][:auth_token])

  	if user
  		render text: "verified", status: 200
  	else
  		render text: "Invalid token", status: 422
  	end
  end

  def destroy
  end

end
