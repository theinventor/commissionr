class Commission < ActiveRecord::Base
  belongs_to :customer

  validates_uniqueness_of :customer_id, scope: [:month,:year]

  def amount
    if amount_cents and amount_cents != 0
      amount_cents / 100.0
    else
      0
    end
  end

  def amount= dollars
    self.amount_cents = (dollars.to_f*100).round if dollars.present?
  end

  def self.months
    %w"January February March April May June July August September October November December"
  end

  def self.years
    %w"2014"
  end
end
