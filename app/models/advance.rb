require 'util'
class Advance < ActiveRecord::Base
	include Util
  belongs_to :client
  has_many :item_advances, dependent: :delete_all
  validates :client_id, presence: true
  validates :date_advance, presence: true
  validates :price, presence: true
  validates :balance, presence: true
  validates :number_parts, presence: true

  after_create :generate_item

  def generate_item
  	valor_parcela = self.price / self.number_parts
  	n_da_parcela = 1
  	data = self.date_advance + 1.day
  	ActiveRecord::Base.transaction do
  		self.number_parts.times.each do |p|
  		  data = proximo_dia_util(data)
  	  	self.item_advances.create!(parts: "#{n_da_parcela}/#{self.number_parts}" , price: valor_parcela, due_date: data, dalay: 0)
  	  	data = data + 1.day
  	  	n_da_parcela = n_da_parcela + 1
    	end
    end
  end

end
