class Number < ActiveRecord::Base
  belongs_to :numerator, :class_name => "Numerator", :foreign_key => "numerator_id"
  belongs_to :position, :class_name => "Position", :foreign_key => "position_id"

  scope :first_number, where("numbers.called is NULL").order('number')
  scope :last_number_call, where("numbers.called is NOT NULL").order('called desc')
end
