class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end
  
  def facebook 
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted? 
      sign_in_and_redirect @user, :event == :authentication
    else
      redirect_to new_user_registration_url
    end
  end

  
end 

