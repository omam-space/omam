require 'rails_helper'

RSpec.describe Volume, type: :model do
  before(:each) do
    Volume.delete_all
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

  it "A Volume must be created if it doens't exists yet" do
    expect(@volume.save).to be true
    expect(File.exists?(@volume.address)).to be true
  end
end
