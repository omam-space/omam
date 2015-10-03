require 'rails_helper'

RSpec.describe VolumesController, type: :controller do
  before(:each) do
    Volume.delete_all
    @volume = FactoryGirl.create(:volume)
  end

  describe "GET #index" do
    it "assigns @volumes" do
      get :index
      expect(assigns(:volumes)).to eq([@volume])
    end
  end
  
  describe "GET #show" do
    it "assigns the requested volume to @volume" do
      get :show, id: @volume
      expect(assigns(:volume)).to eq(@volume)
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "Saves the new Volume in the database"
    end
    
    context "with invalid attributes" do
      it "Doesn't save the new Volume in the database"
    end
  end

  describe "PUT #create" do
    context "with valid attributes" do
      it "Updates a Volume in the database"
    end
    
    context "with invalid attributes" do
      it "Doesn't update a Volume in the database"
    end
  end

  describe "DELETE #create" do
    context "with valid id" do
      it "Delete a Volume in the database"
    end
    
    context "with invalid id" do
      it "Doesn't delete a Volume in the database"
    end
  end
end