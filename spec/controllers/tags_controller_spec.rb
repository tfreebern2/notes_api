require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  before do
    @note = FactoryGirl.create(:note)
    post :create, params: { tag: { name: 'Crazy'}, note_id: @note.id }
  end

  describe "tags#create action" do
    it "should return 200 status-code" do
      expect(response).to be_success
    end

    it "should successfully create and save a new tag in our database" do
      expect(@note.tags.first.name).to eq('Crazy')
    end
  end
end
