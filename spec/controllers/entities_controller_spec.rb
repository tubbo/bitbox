require 'spec_helper'

describe EntitiesController do
  fixtures :users, :folders, :entities

  include Devise::TestHelpers

  let(:user) { users :tubbo }
  let(:folder) { folders :sync_folder }
  let(:entity) { entities :example_text_file }

  before do
    sign_in user
    system "touch #{entity.path}"
  end

  it "views all entities in a folder" do
    get :index, folder_id: folder.id, format: :json

    expect(response).to be_success, "#{response.status}"
  end

  it "views all entities which match given filters" do
    get :index, folder_id: folder.id, name: entity.name, format: :json
    entities = assigns(:entities).map(&:id)

    expect(response).to be_success
    expect(entities).to include(entity.id)
  end

  it "renders the details for a specific entity" do
    get :show, folder_id: folder.id, id: entity.id, format: :json

    expect(response).to be_success
    expect(assigns(:entity).id).to eq(entity.id)
  end

  it "deletes an entity from the folder" do
    delete :destroy, folder_id: folder.id, id: entity.id, format: :json

    expect(response).to be_redirect
  end

  it "uploads a new file as an entity into the folder"

  after { system "rm -rf #{entity.path}" }
end
