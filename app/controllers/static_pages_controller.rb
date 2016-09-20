class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_admin

	def dashboard
    @item_advances = ItemAdvance.joins(:client, :city).select("cities.id as id, cities.name as cidade, sum(item_advances.price) as valor, sum(item_advances.value_payment) as valor_pago").where("DATE(due_date) = ? ", Date.current.to_s ).group("cities.name, cities.id").order('cities.name')
	end
end
