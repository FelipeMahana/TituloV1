ActiveAdmin.register Plan do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :price, :date_start, :duration, :contract_type, :description, :discount
  #
  # or
  #
  # permit_params do
  #   permitted = [:price, :date_start, :duration, :contract_type, :description, :discount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :duration, :description, :contract_type

  index do
   column :duration
   column :contract_type do |plan|
     if plan.contract_type == 1
       'Plan Entrenamiento'
     elsif plan.contract_type == 2
        'Plan Nutrición'
     elsif plan.contract_type == 3
        'Plan Entrenamiento con Nutrición'
     end
   end
   column :description
   actions
  end

  form do |f|
    inputs 'Planes' do
      input :duration
      input :contract_type
      input :description
    end
    actions
  end

  filter :duration, as: :select
  filter :contract_type, as: :select

end
