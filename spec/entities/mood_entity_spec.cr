
require "./spec_helper"

describe MeokLog::Entities::Mood do
  describe "#initialize" do
    describe "when name is set to bon" do
      describe "when stress is set to 0" do
          it "save mood" do
            subject = MeokLog::Entities::Mood.new("bon", 0)
            expect(subject.name).to eq "bon"
            expect(subject.stress).to eq 0
        end
      end
    end
  end
end
