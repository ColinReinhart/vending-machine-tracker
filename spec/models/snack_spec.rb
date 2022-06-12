require "rails_helper"

RSpec.describe Snack, type: :model do
  context 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many(:machines).through(:machine_snacks) }
  end

  context "#price_to_dollar" do
    it "can convert price to dollar" do
      colin = Owner.create!(name: "Colin")
      machine1 = Machine.create!(location: "Don's Mixed Drinks", owner_id: "#{colin.id}")
      snack1 = Snack.create!(name: "Flaming Hot Cheetos", price: 250)

      expect(snack1.price_to_dollar).to eq("2.50")
    end
  end
end
