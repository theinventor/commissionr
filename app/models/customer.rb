class Customer < ActiveRecord::Base

  has_many :commissions

  scope :find_by_name, (lambda do |name|
     firstname = name.split(' ', 2).first
     lastname = name.split(' ', 2).last

     if Rails.env.development?
       limit(10).where(first_name: firstname)
     else
       if name.split(' ', 2).size == 1 # name input is one name
         limit(10).where('first_name ILIKE (?) OR last_name ILIKE (?)', "#{name}%", "#{name}%")
       else
         limit(10).where('firstname ILIKE (?) AND lastname ILIKE (?)', "#{firstname}%", "#{lastname}%")
       end
     end

  end)


  def expected_amount
    if expected_amount_cents and expected_amount_cents != 0
      expected_amount_cents / 100.0
    else
      0
    end
  end

  def expected_amount= dollars
    self.expected_amount_cents = (dollars.to_f*100).round if dollars.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
