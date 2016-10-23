
require "./spec_helper"

describe MeokLog::Resolvers::Extension do

  describe "#select" do
    it "select only yaml files" do
      file_list = ["1.yaml", "2.md", "3.yml"]
      pattern = /ya?ml/
      subject = MeokLog::Resolvers::Extension
      expect(subject.select(file_list, pattern).size).to eq 2
    end
    it "selects only md files" do
      file_list = ["1.yaml", "2.md", "3.yml"]
      pattern = /md/
      subject = MeokLog::Resolvers::Extension
      expect(subject.select(file_list, pattern).size).to eq 1
    end
  end
end
