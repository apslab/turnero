class Numerator < ActiveRecord::Base
	has_many :numbers, :class_name => "Number"
end
