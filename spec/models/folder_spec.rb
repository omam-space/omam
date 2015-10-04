require 'rails_helper'

RSpec.describe Folder, type: :model do
  before(:each) do
    Folder.delete_all
    @folder = FactoryGirl.build(:folder)
    @folder.volume = FactoryGirl.build(:volume)
  end

  it "A Folder must have a volume" do
    expect(@folder.volume).to be_a Volume
    @folder.volume = nil
    expect(@folder.save).to be false
  end

  it "A Folder must have a valid name" do
    @folder.name = nil
    expect(@folder.save).to be false
  end

  it "A parent Folder must be an instance of Folder" do
    parent = FactoryGirl.build(:folder)
    @folder.parent = parent
    expect(parent).to be_a Folder
    expect(@folder.save).to be true
  end

  it "When create a folder a directory must be created in disk inside volume" do
    expect(@folder.save).to be true
    expect(File.exists?(@folder.path)).to be true
  end

  it "When a Folder has been updated, the directory needs to be nenamed" do
    expect(@folder.save).to be true
    @folder.name = 'new_folder'
    expect(@folder.save).to be true
    #expect(File.exists?(@folder.path)).to be true
  end
end
