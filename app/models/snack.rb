class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def price_to_dollar
    self.price.to_s.rjust(3, "0").insert(-3, ".")
  end
end
