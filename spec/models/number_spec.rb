require 'spec_helper'

#t.integer  "numerator_id"
#t.integer  "number"
#t.datetime "called"
#t.datetime "created_at",   :null => false
#t.datetime "updated_at",   :null => false
#t.integer  "position_id"

describe Number do

	before { @number = Number.new }
	subject { @number }
	
	before do
		@number_tipo = Number.new :called => DateTime.now , :number => 1 
	end

	it {should respond_to :number }

	it { should respond_to :called }
end
