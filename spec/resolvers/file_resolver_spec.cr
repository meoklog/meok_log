
require "./spec_helper"

describe MeokLog::Resolvers::File do
  describe "#read_all" do
    it "get content of files" do
      reader = ->( file : String ) { file.to_s }
      subject = MeokLog::Resolvers::File
      expect(subject.read_all(["1.md", "2.md"], "dir", reader)).to be_a Array(String)
    end
  end
end
