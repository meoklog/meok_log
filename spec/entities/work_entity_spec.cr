
require "./spec_helper"

describe MeokLog::Entities::Work do
  describe "#initialize" do
    describe "when has_worked is set to true" do
      it "save the work" do
        subject = MeokLog::Entities::Work.new(true)
        expect(subject.has_worked).to eq true
      end
    end
  end
end
