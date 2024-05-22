require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(User.count).to eq(1)
      end

      it "redirects to the root path" do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to(root_path)
      end

      it "displays success notice" do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(flash[:notice]).to eq("Account created successfully")
      end
    end

    context "with invalid attributes" do
      it "does not save the user" do
        post :create, params: { user: FactoryBot.attributes_for(:user, email: nil) }
        expect(User.count).to eq(0)
      end

      it "renders the new template" do
        post :create, params: { user: FactoryBot.attributes_for(:user, email: nil) }
        expect(response).to render_template("new")
      end
    end
  end
end
