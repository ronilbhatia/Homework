require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(email: "ronil@ronil.com", password: "valid_password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "makes sure the password is correct" do
      expect(user.is_password?("valid_password")).to be true
    end

    it "returns false if password is not correct" do
      expect(user.is_password?("invalid_password")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "resets the user's session token" do
      original_token = user.session_token
      user.reset_session_token!
      expect(original_token).to_not eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }
    it "finds the correct user based on credentials" do
      expect(User.find_by_credentials(user.email, user.password)).to eq(user)
    end

    it "returns nil if credentials are invalid" do
      expect(User.find_by_credentials("fakename@fake.com", "faker")).to_not eq(user)
    end
  end
end
