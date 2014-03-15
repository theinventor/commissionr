json.array! @customers do |customer|
  json.name customer.full_name
  json.record customer.id
  json.tokens [customer.first_name, customer.last_name]
  json.value customer.last_name
end
