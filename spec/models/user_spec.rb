require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validates presence of username" do
      user = User.new(password: "andrew")

      user.valid?
      expect(user.errors).to be_present
    end
  end

  describe "class methods" do
    describe "::find_by_credentials" do
      it "finds users by credentials" do
        user = User.create(username: "mcarlsen", password: "password" )

        expect(User.find_by_credentials("mcarlsen", "password")).to be_a(User)
      end
    end

  end

end
