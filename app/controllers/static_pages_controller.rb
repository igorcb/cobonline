class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_admin

	def dashboard
    @item_advances = ItemAdvance.joins(:client, :city).select("cities.id as id, cities.name as cidade, sum(item_advances.price) as valor, sum(item_advances.value_payment) as valor_pago").where("DATE(due_date) = ? ", Date.current.to_s ).group("cities.name, cities.id").order('cities.name')
	end

	def advance_dashboard
		
	end

	def advance_search
		@data_ini = params[:data_ini]
		@data_fim = params[:data_fim]
	 	@advances = Advance.where("DATE(date_advance) >= ? AND DATE(date_advance) <= ?", @data_ini, @data_fim)
	end
end
