class Numerator < ActiveRecord::Base
  has_many :numbers, :class_name => "Number"

  def find_puesto(number)
  	if number.nil?
  		return ''
  	else
  		position = self.numbers.where("number = " + number.to_s).first.position
  		
  		if position.nil?
  			return 'x'
  		else
  		   position.name.nil? ? 'y' : position.name.to_s
  	    end
  	end
  end

end
