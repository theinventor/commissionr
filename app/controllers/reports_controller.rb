class ReportsController < ApplicationController

  def index

  end

  def carrier
   render text: "coming soon :)"
  end

  def month

    if params[:month]
      commissions = Commission.where(month: params[:month])
      customer_ids = Customer.pluck(:id)
      missing_customer_ids = customer_ids-commissions.pluck(:customer_id)
      customers = Customer.where(id: missing_customer_ids)
      @results = customers
    end
  end
end
