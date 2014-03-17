class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.order(:last_name).paginate per_page: 100, page: params[:page]
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  def autocomplete_query
    if params[:filter] == "all"
      @customers = Customer.all
    else
      @customers = Customer.find_by_name(params[:query])
    end
    render json: @customers, root: false
  end

  def import

  end

  def upload
    require 'csv'
    file = params[:csv_file][:file]
    @result = []
    CSV.foreach(file.tempfile.path) do |row|
      @result << row
    end

    if params[:csv_file][:commit] == 'true'
      result = []
      CSV.foreach(file.tempfile.path, headers: true) do |row|
        Customer.create first_name row['first_name'],
                                   last_name: row['last_name'],
                                   dob: row['dob'],
                                   start_date: Date.parse("2014-01-01"),
                                   carrier: row['carrier'],
                                   expected_amount: row['expected_amount'],
                                   notes: row['notes']
        result << row
      end
      @count = result.size
      render text: "Import done, we imported #{@count} customers"
    end

  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to new_customer_path, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :dob, :carrier, :expected_amount, :start_date, :notes)
  end
end
