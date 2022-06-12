require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  context "#average_price" do
    it "can average the prices of snacks in machine" do
      colin = Owner.create!(name: "Colin")
      machine1 = Machine.create!(location: "Don's Mixed Drinks", owner_id: "#{colin.id}")
      snack1 = Snack.create!(name: "Flaming Hot Cheetos", price: 250)
      snack2 = Snack.create!(name: "White Castle Burger", price: 350)
      mc1 = MachineSnack.create!(snack_id: "#{snack1.id}", machine_id: "#{machine1.id}")
      mc2 = MachineSnack.create!(snack_id: "#{snack2.id}", machine_id: "#{machine1.id}")

      expect(machine1.average_price).to eq(300)
    end
  end
end
