class ContractsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :show]
	before_action :set_params, only: [:create, :update]
	before_action :set_plan, only: [:new, :edit, :update, :create]
	before_action :set_contract, only: [:edit, :show, :update]

	def new
		@contract = Contract.new
	end

	def edit

	end

	def show

	end

	def update
		@contract.plan_id = params[:plan_id]
		@contract.update(set_params)
		redirect_to profile_path
		#redirect_to plan_contract_path(@contract.plan_id, @contract)
	end

	def create
		@contract = Contract.new(set_params)
		@contract.plan_id = params[:plan_id]
		@contract.user_id = current_user.id
		@contract.pending = true
		@contract.start_date = DateTime.now.strftime "%d/%m/%Y"
    if @plan.duration == 1
      @contract.end_date = DateTime.now.next_month.strftime "%d/%m/%Y"
    else @plan.duration == 3
      @contract.end_date = @contract.start_date >> 3
    end
		@contract.save
		if @contract.save
             redirect_to root_path(), notice: 'Se creo contrato con exito'
						 #redirect_to plan_contract_path(@contract.plan.id, @contract), notice: 'Se creo contrato con exito' show
       else
             redirect_to new_plan_contract_path(@contract.plan_id), notice: 'No se pudo crear contrato'
       end
	end

	private

	def set_params
		params.require(:contract).permit(:weight, :height, :age, :sex, :commit, :goal, :fat_percentage, :plan_id, :end_date, :start_date, :category)
	end

	def set_contract
		@contract = Contract.find(params[:id])
	end

	def set_plan
		@plan = Plan.find(params[:plan_id])
	end
end
