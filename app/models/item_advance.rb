require 'util'
class ItemAdvance < ActiveRecord::Base
	include Util
  belongs_to :advance
  has_one :client, through: :advance

  def baixa_parcela(date, value)
  	last_parts = self.advance.item_advances.last
  	advance = self.advance
  	saldo = advance.saldo_devedor.to_f 
    puts ">>>>>>>>>>>>>>> venc: #{last_parts.due_date}"
    puts ">>>>>>>>>>>>>>> saldo: #{(saldo).to_f}"
    data_pagamemto = last_parts.due_date
    if ((last_parts.due_date == data_pagamemto) && (saldo > 0.00)) 
    	puts ">>>>>>>>>>>>>>> generate_new_parts"
    	n_da_parcela = last_parts.parts
    	parcela = n_da_parcela[0..2]
    	parcela = (parcela.to_i + 1).to_s.rjust(3, '0')
    	valor_parcela = last_parts.price
    	data = proximo_dia_util(last_parts.due_date + 1.day)
    	advance.item_advances.create!(parts: "#{parcela}/#{advance.number_parts}" , price: valor_parcela, due_date: data, dalay: 0)
    
    else
    	puts ">>>>>>>>>>>>>>> emprestimo quitado com sucesso."
    end
  end

  def get_next_parts
  	ItemAdvance.where("advance_id = :advance_id AND due_date > :due_date",{advance_id: self.advance_id, due_date: self.due_date}).order(:due_date).limit(1)
  end

end
