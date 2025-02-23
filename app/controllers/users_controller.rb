class UsersController < ApplicationController
  def register
      @user = User.new(user_params)
      if @user.save
        Rails.logger.info("User created successfully with email: #{@user.email}")
        UserMailer.registration_email(@user).deliver_now
        render json:  @user, status: :created, serializer: UserSerializer
        

        
      else
        Rails.logger.error("Error creating user. Errors:  email: #{@user.email}, phone: #{@user.phone} #{@user.errors.full_messages}")
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
  end
    
  def login
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
          @user.update(status: "Active")
          jwt_token = create_jwt_token(@user)
          render json: { message: "User logged in successfully",  jwt_token: "#{jwt_token}"  }, status: :ok
      else
          render json: { message: "User details incorrect" }, status: :unauthorized
      end
  end
  def list_users
      @users = User.page(params[:page]).per(params[:per_page])
      render json: @users, status: :ok
  end
  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone)
  end

  def create_jwt_token(user)
      secret_key = 'default-secret-key'
      JWT.encode({ user_id: user.id, exp: 30.minutes.from_now.to_i }, secret_key, 'HS256')
  end
    
end