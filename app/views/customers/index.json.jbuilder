json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :dob, :carrier, :expected_amount_cents
  json.url customer_url(customer, format: :json)
end
