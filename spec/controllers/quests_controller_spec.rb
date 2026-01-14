require 'rails_helper'

RSpec.describe QuestsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "orders quests by created_at desc" do
      old_quest = Quest.create!(name: "Old Quest", created_at: 1.day.ago)
      new_quest = Quest.create!(name: "New Quest", created_at: Time.current)

      get :index
      quests = controller.instance_variable_get(:@quests)
      expect(quests.first).to eq(new_quest)
      expect(quests.last).to eq(old_quest)
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      quest = Quest.create!(name: "Test Quest")
      get :show, params: { id: quest.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new quest" do
      expect {
        post :create, params: { quest: { name: "New Quest" } }
      }.to change(Quest, :count).by(1)
    end

    it "redirects to quests path for HTML format" do
      post :create, params: { quest: { name: "New Quest" } }, format: :html
      expect(response).to redirect_to(quests_path)
    end
  end

  describe "PATCH #update" do
    it "updates the quest" do
      quest = Quest.create!(name: "Old Name")
      patch :update, params: { id: quest.id, quest: { name: "New Name" } }, format: :html
      quest.reload
      expect(quest.name).to eq("New Name")
    end

    it "updates is_done status" do
      quest = Quest.create!(name: "Test", is_done: false)
      patch :update, params: { id: quest.id, quest: { is_done: true } }, format: :html
      quest.reload
      expect(quest.is_done).to be true
    end
  end

  describe "DELETE #destroy" do
    it "destroys the quest" do
      quest = Quest.create!(name: "To Delete")
      expect {
        delete :destroy, params: { id: quest.id }, format: :html
      }.to change(Quest, :count).by(-1)
    end

    it "redirects to quests path" do
      quest = Quest.create!(name: "To Delete")
      delete :destroy, params: { id: quest.id }, format: :html
      expect(response).to redirect_to(quests_path)
    end
  end
end
