class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:user_contracts, :profile]
  def index
    @plans = Plan.all
  end

  def profile

  end

  def contact

  end

  def terms_and_conditions

  end

  def user_contracts
    @users = User.all
    #Kaminary
    # @users = User.order(:created_at).page(params[:page])
    # cuenta los admin y los que cambiaron de estado
    # @user.each do |users|
    #   if users.role == 'guest'
    #     @users = User.order(:created_at).page(params[:page]).per(8)
    #   end
    # end
  end
end
