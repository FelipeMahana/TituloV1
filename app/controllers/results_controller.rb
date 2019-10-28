class ResultsController < ApplicationController
  before_action :set_user
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET users/1/results
  def index
    @results = @user.results
  end

  # GET users/1/results/1
  def show
  end

  # GET users/1/results/new
  def new
    @result = @user.results.build
  end

  # GET users/1/results/1/edit
  def edit
  end

  # POST users/1/results
  def create
    @result = @user.results.build(result_params)

    if @result.save
      redirect_to([@result.user, @result], notice: 'Result was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/results/1
  def update
    if @result.update_attributes(result_params)
      redirect_to([@result.user, @result], notice: 'Result was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/results/1
  def destroy
    @result.destroy

    redirect_to user_results_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_result
      @result = @user.results.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def result_params
      params.require(:result).permit(:date, :hundred_mts, :two_hundred_mts, :three_hundred_mts, :four_hundred_mts, :eight_hundred_mts, :thousand_mts, :thousand_five_hundred_mts, :cooper_test, :squat_rm)
    end
end
