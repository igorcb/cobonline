class CurrentAccount < ActiveRecord::Base
  belongs_to :city
  belongs_to :cost

  validates :city_id, presence: true
  validates :cost_id, presence: true
  validates :date_ocurrence, presence: true
  validates :type_launche, presence: true
  validates :price, presence: true
  
  module TypeLaunche
    DEBITO = -1
    CREDITO = 1
  end

  def credito_debito
  	case self.type_launche
  		when -1 then "Débito"
  		when  1	then "Crédito"
  		else ""
  	end
  end

  def self.ransackable_attributes(auth_object = nil)
    ['date_ocurrence', 'city_id', 'cost_id', 'historic' ]
  end


  # def self.saldo(date=nil)
  #   date.nil? ? CurrentAccount.sum('price*type_launche') : CurrentAccount.where(date_ocurrence: date).sum('price*type_launche')
  # end
  
  def self.saldo(city, date=nil)
    date.nil? ? CurrentAccount.where(city_id: city).sum('price*type_launche') : CurrentAccount.where(city_id: city, date_ocurrence: date).sum('price*type_launche')
  end

end
