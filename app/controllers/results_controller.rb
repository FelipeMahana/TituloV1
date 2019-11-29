class ResultsController < ApplicationController
  before_action :set_user
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET users/1/results
  def index
    @todos = Result.all
    @results = @user.results
    #@inicio_graf = params[:start].try(:to_date) || 180.days.ago.to_date
    #@fin_graf = params[:end].try(:to_date) || Date.current

    @inicio_graf = params[:start].try(:to_date).try(:beginning_of_month) || 180.days.ago.beginning_of_month
    @fin_graf = params[:end].try(:to_date).try(:end_of_month) || Date.today.end_of_month

    @range = (@inicio_graf..@fin_graf)

    @promedio_100 = (@todos.average(:hundred_mts))
    @promedio_100individual = (@results.average(:hundred_mts))
    @promedio_200 = (@todos.average(:two_hundred_mts))
    @promedio_200individual = (@results.average(:two_hundred_mts))
    @promedio_300 = (@todos.average(:three_hundred_mts))
    @promedio_300individual = (@results.average(:three_hundred_mts))
    @promedio_400 = (@todos.average(:four_hundred_mts))
    @promedio_400individual = (@results.average(:four_hundred_mts))
    @promedio_800 = (@todos.average(:eight_hundred_mts))
    @promedio_800individual = (@results.average(:eight_hundred_mts))
    @promedio_1000 = (@todos.average(:thousand_mts))
    @promedio_1000individual = (@results.average(:thousand_mts))
    @promedio_1500 = (@todos.average(:thousand_five_hundred_mts))
    @promedio_1500individual = (@results.average(:thousand_five_hundred_mts))
    @promedio_CT = (@todos.average(:cooper_test))
    @promedio_CTindividual = (@results.average(:cooper_test))
    @promedio_Squat = (@todos.average(:squat_rm))
    @promedio_Squatindividual = (@results.average(:squat_rm))
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
    @result.date = DateTime.now.strftime "%d/%m/%Y"
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
