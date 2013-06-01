require 'spec_helper'

describe Entity do
  fixtures :folders
  let(:sync_folder) { folders :sync_folder }
  before { system "touch #{sync_folder.path}/test.txt" }
  subject { Entity.new folder: sync_folder, name: "test.txt" }

  it "tracks a file in the sync folder" do
    subject.should be_valid
  end

  after { system "rm -rf #{sync_folder.path}/test.txt" }
end
