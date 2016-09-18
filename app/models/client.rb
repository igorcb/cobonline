class Client < ActiveRecord::Base
  belongs_to :city
  has_many :advances
  validates :city_id, presence: true
  validates :name, presence: true
end
