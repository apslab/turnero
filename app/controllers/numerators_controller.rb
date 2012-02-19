class NumeratorsController < ApplicationController
  # GET /numerators
  # GET /numerators.json
  def index
    @numerators = Numerator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @numerators }
    end
  end

  def list_numerators
    @numerators = Numerator.all
    respond_to do |format|
      format.html 
      format.json { render json: @numerators }
    end
  end

  def call_numerators
    @numerators = Numerator.all
    @position = Position.find(1)
    respond_to do |format|
      format.html 
      format.json { render json: @numerators }
    end
  end

  def last_numbers
    @numerators = Numerator.all
    @numerators.each do |item|
      item.current = item.numbers.last_number_call.first.try(:number)
    end
    respond_to do |format|
      format.html 
      format.json { render json: @numerators }
    end
  end

  # GET /numerators/1
  # GET /numerators/1.json
  def show
    @numerator = Numerator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @numerator }
    end
  end

  # GET /numerators/new
  # GET /numerators/new.json
  def new
    @numerator = Numerator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @numerator }
    end
  end

  # GET /numerators/1/edit
  def edit
    @numerator = Numerator.find(params[:id])
  end

  def call_first_number
    @numerator = Numerator.find(params[:numerator_id])
    @position = Position.find(params[:position_id])

    @number = @numerator.numbers.first_number.first
    @number.position_id = @position.id

    unless @number.nil?
      @number.called = DateTime.now
      
      respond_to do |format|
        if @number.save
          format.html { redirect_to call_url, notice: 'llamando al numero ' + @number.number.to_s + ' del ' + @numerator.name.to_s }
        end
      end
    else
       respond_to do |format|
        format.html { redirect_to call_url, notice: 'no hay numeros para ' + @numerator.name.to_s }
       end
    end
  end

  def add_number
    @numerator = Numerator.find(params[:id])
    @number = Number.new 
    @number.numerator_id = @numerator.id
    
    @number.number = @numerator.current.nil? ? 1 : @numerator.current + 1
    @numerator.current = @number.number
    
    @number.save

    respond_to do |format|
      if @numerator.save
        format.html { redirect_to list_url }
      end
    end
  end

  # POST /numerators
  # POST /numerators.json
  def create
    @numerator = Numerator.new(params[:numerator])

    respond_to do |format|
      if @numerator.save
        format.html { redirect_to @numerator, notice: 'Numerator was successfully created.' }
        format.json { render json: @numerator, status: :created, location: @numerator }
      else
        format.html { render action: "new" }
        format.json { render json: @numerator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /numerators/1
  # PUT /numerators/1.json
  def update
    @numerator = Numerator.find(params[:id])

    respond_to do |format|
      if @numerator.update_attributes(params[:numerator])
        format.html { redirect_to @numerator, notice: 'Numerator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @numerator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numerators/1
  # DELETE /numerators/1.json
  def destroy
    @numerator = Numerator.find(params[:id])
    @numerator.destroy

    respond_to do |format|
      format.html { redirect_to numerators_url }
      format.json { head :no_content }
    end
  end
end
