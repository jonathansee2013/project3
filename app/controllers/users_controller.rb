class UsersController < ApplicationController
#
before_action :check_if_logged_in, only: [:index, :show, :edit, :update, :search, :destroy]
# before_action :check_if_admin, only: [:index]
before_action :get_user, only: [:show, :edit, :update, :destroy]

  def get_user
    @user = User.find params["id"]
  end

  def index
    @users = User.all
  end

  def show
    @age = age( @user.dob )
  end

  def age(dob)

    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)

  end

  def new
    @user = User.new
  end

  def create

    @user = User.new user_params
    # binding.pry
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["public_id"]
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end

  end

  def search
  end


  def result
    @results = user_search
  end

  def edit
    redirect_to user_path unless @current_user == @user
  end

  def update

    @user = @current_user
    @user.update user_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["public_id"]
      @user.save
    end

    redirect_to user_path(params["id"])

  end

  def destroy
    @user.destroy

    if @current_user.is_admin?
      redirect_to users_path
    else
      redirect_to signup_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image, :gender, :dob, :country, :interest)
  end

  def user_search
    gender = params[:gender]
    min_age = params[:minimum_age]
    max_age = params[:maximum_age]
    country = params[:country]
    interest = params[:interest]

    # https://stackoverflow.com/questions/18236607/search-for-users-age-based-on-date-of-birth
    # if min_age.present? && max_age.present?
    #   min = [ min_age, max_age ].min
    #   max = [ min_age, max_age ].max
    #   min_date = Date.today - min.years
    #   max_date = Date.today - max.years
    #   users = users.where("birthday BETWEEN ? AND ?", max_date, min_date)
    # end

    users = User.order(:username)
    users = users.where(gender: gender) if gender.present?
    users = users.where("dob <= ?", Date.today - min_age.to_i.years) if min_age.present?
    users = users.where("dob >= ?", Date.today - max_age.to_i.years) if max_age.present?
    users = users.where("country like ?", "%#{country}%") if country.present?
    users = users.where("interest like ?", "%#{interest}%") if interest.present?
    # SQL substring search: interest like '%dogs%'
    users
  end
  # def profile_params
  #   params.require(:user).permit(:username, :email, :password, :password_confirmation, :gender, :dob, :country, :interest)
  # end

end
