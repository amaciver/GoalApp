require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { User.create(username: "andrew", password: "andrew") }

  before :each do
    controller.login(user)
  end

  describe "#login" do
    it "logs in a given user" do
      expect(session[:session_token]).to eq(user.session_token)
    end
  end

  describe "#logout" do
    it "logs out" do
      controller.logout
      expect(session[:session_token]).to_not eq(user.session_token)
    end

    it "nils out session token" do
      controller.logout
      expect(session[:session_token]).to be_nil
    end

  end

  describe "#current_user" do
    it "finds the current user" do
      expect(controller.current_user).to be(user)
    end
  end


end
