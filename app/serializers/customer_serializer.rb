class CustomerSerializer < ActiveModel::Serializer
  attributes :name, :record, :tokens, :value, :location

  def name
    object.full_name
  end

  def carrier
    object.carrier
  end

  def record
    object.id
  end

  def tokens
    [object.first_name, object.last_name]
  end

  def value
    object.last_name
  end

  def location
    customer_path(object)
  end
end
