require 'rails_helper'

def sign_in user
  session[:user_id] = user.id
end

RSpec.describe SessionsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid credentials" do
      it "logs in the user" do
        post :create, params: { email: user.email, password: user.password }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(root_path)
      end

      it "sets the notice" do
        post :create, params: { email: user.email, password: user.password }
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid credentials" do
      it "does not log in the user" do
        post :create, params: { email: user.email, password: "wrongpassword" }
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
      end

      it "sets the alert" do
        post :create, params: { email: user.email, password: "wrongpassword" }
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE #terminate" do
    it "logs out the user" do
      sign_in user
      delete :terminate
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end

    it "sets the notice" do
      sign_in user
      delete :terminate
      expect(flash[:notice]).to be_present
    end
  end
end
