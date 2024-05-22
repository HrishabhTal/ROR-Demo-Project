class SessionsController <ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def terminate
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out"
  end
end