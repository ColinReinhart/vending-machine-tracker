require "rails_helper"

RSpec.describe "Snack show page" do
  before :each do
    @colin = Owner.create!(name: "Colin")

    @machine1 = Machine.create!(location: "Don's Mixed Drinks", owner_id: "#{@colin.id}")
    @machine2 = Machine.create!(location: "Turing Basement", owner_id: "#{@colin.id}")

    @snack1 = Snack.create!(name: "Flaming Hot Cheetos", price: 250)
    @snack2 = Snack.create!(name: "White Castle Burger", price: 350)

    @mc1 = MachineSnack.create!(snack_id: "#{@snack1.id}", machine_id: "#{@machine1.id}")
    @mc2 = MachineSnack.create!(snack_id: "#{@snack1.id}", machine_id: "#{@machine2.id}")
  end

  it "should show name and price of snack" do
    visit "/snacks/#{@snack1.id}"

    expect(page).to have_content("Flaming Hot Cheetos")
    expect(page).to have_content("Price: $2.50")
  end

  xit "should shoud locations with snack" do
    visit "/snacks/#{@snack1.id}"

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
  end

  xit "should show count and average of snacks at each location" do
    visit "/snacks/#{@snack1.id}"
    expect(page).to have_content("Don's Mixed Drinks (1 kinds of snacks, average price of $2.50)")
    expect(page).to have_content("Turing Basement (1 kinds of snacks, average price of $2.50)")
  end
end
