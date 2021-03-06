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
      customer_ids = params[:carrier] ? Customer.where('start_date < ?',start_date+2.day).where(carrier: params[:carrier]).pluck(:id) : Customer.where('start_date < ?',start_date+2.day).pluck(:id)
      missing_customer_ids = customer_ids-commissions.pluck(:customer_id)
      customers = Customer.where(id: missing_customer_ids)
      @results = customers
    end
  end
end
