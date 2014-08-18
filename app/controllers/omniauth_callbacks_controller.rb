class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)
    if @user.persisted?
      flash[:notice] = "Welcome to the contacts App! You have successfully logged in with Google!"
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end

  # def twitter
  #   @user = User.find_for_twitter(request.env['omniauth.auth'], current_user)
  #   if @user.persisted?
  #     flash[:notice] = "Welcome to the contacts App! You have successfully logged in with Twitter!"
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session["devise.google_data"] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_path
  #   end
  # end

  # def handle_callback(kind)
  #   case kind
  #   when "twitter"
  #     #collect the data for twitter
  #   when "google"
  #     #collect the data for google

  # end

end