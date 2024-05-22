require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }

  describe "validations" do
    context "when email is present" do
      it "is valid" do
        user.valid?
        expect(user.errors[:email]).to be_empty
      end
    end

    context "when email is not present" do
      it "is invalid" do
        user.email = ""
        user.valid?
        expect(user.errors[:email]).to_not be_empty
      end
    end
  end

  describe "#authenticate" do
    context "when correct password is provided" do
      it "returns true" do
        expect(user.authenticate("password123")).to be_truthy
      end
    end

    context "when incorrect password is provided" do
      it "returns false" do
        expect(user.authenticate("wrongpassword")).to be_falsey
      end
    end
  end
end
