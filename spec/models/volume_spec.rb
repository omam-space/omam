require 'rails_helper'

RSpec.describe Volume, type: :model do
  before(:each) do
    @volume = FactoryGirl.build(:volume)
  end

  it "A Volume must have a label" do
    @volume.label = nil
    expect(@volume.save).to be false
    expect(@volume.errors.messages).not_to be_empty
  end

  it "A Volume must have an address" do
    @volume.address = nil
    expect(@volume.save).to be false
    expect(@volume.errors.messages).not_to be_empty
  end

  it "A Volume needs to represent a valid partition in storage" do
    expect(@volume.exists?).to be true
  end
end
