
require "./spec_helper"

describe MeokLog::Reducers::CountWorking do
  describe "#total" do
    describe "when data are found" do
      describe "when there is day worked" do
        it "count" do
          yaml_data = [
            { travail: "false" },
            { travail: "true" },
            { travail: "false" },
            { travail: "false" },
            { travail: "true" }
          ] of NamedTuple(travail: String)
          subject = MeokLog::Reducers::CountWorking
          expect(subject.total(yaml_data)).to eq 2
        end
      end

      describe "when there is no day worked" do
        it "count" do
          yaml_data = [
            { travail: "false" },
            { travail: "false" },
            { travail: "false" }
          ] of NamedTuple(travail: String)
          subject = MeokLog::Reducers::CountWorking
          expect(subject.total(yaml_data)).to eq 0
        end
      end
    end
  end
end
