require 'spec_helper'

describe FoldersController do
  include Devise::TestHelpers

  fixtures :folders, :users

  let(:user) { users :tubbo }
  let(:folder) { folders :sync_folder }

  before { sign_in user }

  it "views a list of all folders tracked by bitbox" do
    get :index

    expect(response).to be_success
  end

  it "shows a single folder and all of its entries" do
    get :show, id: folder.id

    expect(response).to be_success
    expect(assigns(:folder).id).to eq(folder.id)
  end

  it "creates a new folder on the host machine" do
    post :create, folder: { name: "~/FoldersControllerSync" }

    expect(response).to be_success, "#{response.status}"
  end

  context "when destroyed" do
    before do
      system "mkdir -p ~/FoldersControllerSync"
      delete :destroy, id: folder.id
    end

    it "removes a folder from being tracked" do
      expect(response).to be_redirect
    end
  end
end
