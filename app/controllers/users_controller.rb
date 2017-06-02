class UsersController < ApplicationController
  before_action :set_user, except: [:index, :show, :new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to_format do |format|
        format.html {redirect_to user_path(@user)}
        format.js {}
        format.json { render :create, format: :json, status: 200 }
      end
    else
      respond_to_format do |format|
        format.html {render :new}
        format.js {}
        format.json { render json: @user.errors, status: 422 }
        # format.json { render :create, format: :json, status: 406 }
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      respond_to_format do |format|
        format.html {redirect_to user_path(@user)}
        format.js {}
        format.json { render :update, format: :json, status: 200 }
      end
    else
      respond_to_format do |format|
        format.html {render :edit}
        format.js {}
        format.json { render json: @user.errors, status: 422 }
      end
    end
  end

  def destroy
    if @user.destroy
      respond_to_format do |format|
        format.html {redirect_to users_path}
        format.js {}
        format.json { render :destroy, format: :json, status: 200 }
      end
    else
      respond_to_format do |format|
        format.html {render :index}
        format.js {}
        format.json { render json: @user.errors, status: 422 }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require[:user].permit(permitted_params)
  end

  def edit_user_params
    params.require[:user].permit(permitted_params)
  end

  def permitted_params
    if current_user.role = 'admin'
      return {:email, :password, :active, :role :user_skills_attributes: [:id, :skill_id]}
    else
      return {:email, :password, :active, :user_skills_attributes: [:id, :skill_id]}
    end
  end
end
