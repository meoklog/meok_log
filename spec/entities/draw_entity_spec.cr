
require "./spec_helper"

describe MeokLog::Entities::Draw do
  describe "#initialize" do
    describe "when name is set to tracer" do
      describe "when type is set to fanart" do
        it "save a draw" do
          subject = MeokLog::Entities::Draw.new("tracer", ["fanart", "ink"])
          expect(subject.name).to eq "tracer"
          expect(subject.type).to eq ["fanart", "ink"]
        end
      end
    end
  end
end
