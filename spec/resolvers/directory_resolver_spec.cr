
require "./spec_helper"

describe MeokLog::Resolvers::Directory do
  describe "#fetch" do
    describe "when ressource is found" do
      describe "when files are present" do
        it "get a list of file" do
          reader = -> (dir_name : String) { ["1", "2"] }
          subject = MeokLog::Resolvers::Directory
          expect(subject.fetch("stub", reader)).to be_a Array(String)
        end
      end

      describe "when no files have been found" do
        it "raise an exception" do
          reader = -> (dir_name : String) { [] of String }
          subject = MeokLog::Resolvers::Directory
          expect {
            expect(subject.fetch("stub", reader)).to be_truthy
          }.to raise_error Exception
        end
      end
    end

    describe "when ressource is not set" do
      it "raise an exception" do
        reader = -> (dir_name : String) { [] of String }
        subject = MeokLog::Resolvers::Directory
        expect {
          expect(subject.fetch("", reader)).to be_truthy
        }.to raise_error ArgumentError
      end
    end
  end
end
