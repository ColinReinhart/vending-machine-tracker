require "rails_helper"

RSpec.describe "Machine show page" do
  before :each do
    @colin = Owner.create!(name: "Colin")

    @machine1 = Machine.create!(location: "Don's Mixed Drinks", owner_id: "#{@colin.id}")

    @snack1 = Snack.create!(name: "Flaming Hot Cheetos", price: 250)
    @snack2 = Snack.create!(name: "White Castle Burger", price: 350)

    @mc1 = MachineSnack.create!(snack_id: "#{@snack1.id}", machine_id: "#{@machine1.id}")
  end
  it "should show the name and price of all the snacks in machine" do
    visit "/machines/#{@machine1.id}"

    expect(page).to have_content("Flaming Hot Cheetos")
    expect(page).to have_content("$2.50")

    expect(page).to_not have_content("White Castle Burger")
    expect(page).to_not have_content("$3.50")
  end

  it "should show average price of items in machine" do
    mc2 = MachineSnack.create!(snack_id: "#{@snack2.id}", machine_id: "#{@machine1.id}")
    
    visit "/machines/#{@machine1.id}"

    expect(page).to have_content("Average Price: $3.00")
  end
end
