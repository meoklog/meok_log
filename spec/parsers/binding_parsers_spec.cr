
require "./spec_helper"

describe MeokLog::Parsers::Binding do
  it "#initialize" do
    subject = MeokLog::Parsers::Binding.new
    expect(subject.bindings).to be_truthy
  end

  describe "#fetch" do
    describe "when there is a config" do
      it "save bindings" do
        config_content = YAML.dump({bindings: ["stress", "humeur", "base"]})
        subject = MeokLog::Parsers::Binding.new
        subject.config(config_content)
        expect(subject.bindings.size).to eq(3)
      end
    end

    describe "when there is no config file" do
      describe "when there is at least one md file" do
        describe "and there is yaml meta data" do
          it "get bindings and save it" do
            file_content = "---\ntravail: false\nhumeur: dépassé par les évènements\nstress: 1\ndate: 2016-10-20\n---\n\n- 3ds max\n"
            file_reader = ->( file : String ) { file_content }
            file_resolver = MeokLog::Resolvers::File
            file_fetched = file_resolver.read_all(["1.md"], "data", file_reader)
            subject = MeokLog::Parsers::Binding.new
            subject.md(file_fetched)
            expect(subject.bindings).to eq(["travail", "humeur", "stress", "date"])
          end
        end
        describe "and there is no yaml meta data" do
          it "raise an exception" do
            file_content = "3ds max"
            file_reader = ->( file : String ) { file_content }
            file_resolver = MeokLog::Resolvers::File
            file_fetched = file_resolver.read_all(["1.md"], "data", file_reader)
            subject = MeokLog::Parsers::Binding.new
            expect {
              expect(subject.md(file_fetched)).to be_truthy
            }.to raise_error Exception
          end
        end
      end
    end
  end
end
