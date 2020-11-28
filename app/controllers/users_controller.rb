class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    @user = User.new(user_params)
    names = @user.name.split
    user_arys = []
    names.length.times do
      user_arys << @params
    end
    i = 0
    user_arys.each do |user_hash|
      user_hash["name"] = names[i]
      User.new(user_hash).save
      i += 1
    end
    render :index
    # binding.pry
  end

  private

  def user_params
    @params = params.require(:user).permit(:name)
  end
end
