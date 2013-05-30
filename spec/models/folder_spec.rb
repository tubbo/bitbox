require 'spec_helper'
require 'digest'

describe Folder do
  let(:sync_folder) { Rails.application.config.sync_folder }
  subject { Folder.new name: 'test' }

  it "creates a new directory when one doesn't exist" do
    subject.should be_valid
    subject.secret.should be_present
    File.exists?("#{sync_folder}/test").should be_true
  end

  it "synchronizes with an existing directory" do
    system "mkdir #{sync_folder}/test"

    subject.should be_valid
    subject.secret.should be_present
  end

  it "synchronizes with an existing sync folder" do
    secret_key = Digest::SHA256.new.digest "an existing secret key"
    subject.secret = secret_key

    subject.should be_valid
    subject.secret.should == secret_key
  end

  after { system "rm -rf #{sync_folder}/test" }
end
