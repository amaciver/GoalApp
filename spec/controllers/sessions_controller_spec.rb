require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "logs in the user" do
        User.create(username: "gkasparov", password: "password")
        post :create, user: {username: "gkasparov", password: "password" }

        expect(response).to be_redirect
        expect(response).to redirect_to(user_url(User.find_by_username("gkasparov")))
      end
    end

    context "with invalid params" do
      it "renders new template again" do
        post :create, user: { username: "gkasparov" }

        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    it "logs out the user" do
      user = User.create(username: "gkasparov", password: "password")
      controller.login(user)

      delete :destroy
      expect(response).to redirect_to(new_session_url)
    end
  end
end
