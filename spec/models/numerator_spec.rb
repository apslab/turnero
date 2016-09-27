require 'spec_helper'

 #  t.integer  "init"
 #   t.integer  "current"
 #   t.string   "color"
 #   t.string   "name"
 #   t.datetime "created_at",      :null => false
 #   t.datetime "updated_at",      :null => false
 #   t.string   "backgroundcolor"

describe Numerator do

	before { @numerator = Numerator.new }
	subject { @numerator }
	
	before do
		@numerator_tipo = Numerator.new :init => 1, :current => 1 
	end

	it {should respond_to :init }

	it { should respond_to :current }

	it { should respond_to :name }

	it { should respond_to :color }

	it { should respond_to :backgroundcolor }

end
