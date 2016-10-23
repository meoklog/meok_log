
require "./spec_helper"
require "../src/meok_log/dispatcher"

describe MeokLog::Dispatcher do
   describe "#initialize" do
    describe "when config is povided" do
      describe "when config is valid" do
        it "save a config" do
          config = {data: "data"}
          subject = MeokLog::Dispatcher.new(config)
          expect(subject.config["data"]).to eq "data"
        end
      end
    end
  end
end
