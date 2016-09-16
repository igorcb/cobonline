module ApplicationHelper
  def date_br(date)
    date.nil? ? "" : I18n.l(date, format: '%d/%m/%Y')
  end  
	
	def select_credito_debito
    ([['Débito', -1], ['Crédito', 1]])
  end  
end
