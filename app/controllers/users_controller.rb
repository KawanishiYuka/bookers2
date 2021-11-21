class UsersController < ApplicationController
  def edi
    @user = User.find(:params[:id])
  end

  def update
  end
end
