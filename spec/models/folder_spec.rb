require 'spec_helper'

describe Folder do
  let(:folder_name) { 'SyncTest' }
  subject { Folder.new name: "~/#{folder_name}" }

  it "creates a new directory when one doesn't exist" do
    expect(subject).to be_valid
    expect(subject.secret).to be_present
    expect(subject).to exist
  end

  it "computes the base folder name" do
    expect(subject.basename).to eq(folder_name)
  end

  it "expands the path of the given folder name" do
    expect(subject.path).to eq(File.expand_path("~/#{folder_name}"))
  end

  context "with an existing directory" do
    before { system "mkdir -p #{subject.path}" }

    it "generates a secret" do
      expect(subject).to be_valid
      expect(subject.secret).to_not be_blank
    end
  end

  context "with an existing sync folder" do
    let(:existing_secret) { subject.send(:generator).digest "an existing secret key" }
    before { subject.secret = existing_secret }

    it "can be assigned a secret" do
      expect(subject).to be_valid
      expect(subject.secret).to eq(existing_secret)
    end

    it "creates the folder" do
      expect(subject).to be_valid
      expect(subject).to exist
    end
  end

  after { system "rm -rf #{subject.path}" if subject.exists? }
end
