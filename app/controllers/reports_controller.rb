class ReportsController < ApplicationController

  def index

  end

  def carrier
   render text: "coming soon :)"
  end

  def month

    if params[:month]
      commissions = Commission.where(month: params[:month])
      start_date = Date.strptime("#{params[:month]} 1 2014", "%B %d %Y")
      customer_ids = Customer.where('start_date > ?',start_date-1.day).pluck(:id)
      missing_customer_ids = customer_ids-commissions.pluck(:customer_id)
      customers = Customer.where(id: missing_customer_ids)
      @results = customers
    end
  end
end
