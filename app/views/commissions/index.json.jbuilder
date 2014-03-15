json.array!(@commissions) do |commission|
  json.extract! commission, :id, :customer_id, :month, :year, :amount_cents
  json.url commission_url(commission, format: :json)
end
