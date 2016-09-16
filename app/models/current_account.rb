class CurrentAccount < ActiveRecord::Base
  belongs_to :city
  belongs_to :cost

  def credito_debito
  	case self.type_launche
  		when -1 then "Débito"
  		when  1	then "Crédito"
  		else ""
  	end
  end

  def self.saldo(date=nil)
    date.nil? ? CurrentAccount.sum('price*type_launche') : CurrentAccount.where(date_ocurrence: date).sum('price*type_launche')
  end
  
end
