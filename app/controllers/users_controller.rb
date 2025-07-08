class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    @user=User.new
  end
  def create
    @user= User.create!(set_params)
    if @user.save
      # UserMailer.with(user: @user).welcome_email.deliver_later
      start_new_session_for @user
      redirect_to root_path, notice: "Account Created added succesfully"
    else
      render :new
      flash.now[:alert] = "Failed to add your Account"
      flash.now[:alert] = @user.errors.full_messages.join(", ")
    end
  end
  private
    def set_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
    end
end
