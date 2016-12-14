
require "./spec_helper"

describe MeokLog::Reducers::CountBinding do
  it "#initialize" do
    bindings = ["stress", "humeur", "base"]
    subject = MeokLog::Reducers::CountBinding.new(bindings)
    expect(subject.bindings).to eq bindings
  end

  describe "#total" do
    describe "when data are found" do
      describe "when there is stress present" do
        it "should count" do
          bindings = ["stress", "humeur", "base"]
          data = [
            {
              "stress": "1",
              "humeur": "pas rassure",
              "base": "true",
              "prog": "true"
            }, {
              "stress": "0",
              "humeur": "determine",
              "base": "true",
              "prog": "true"
            }
          ]
          yaml_data = data.map { |d| YAML.parse(YAML.dump(d)) }
          subject = MeokLog::Reducers::CountBinding.new(bindings, yaml_data)
          expect(subject.total("stress")).to eq 2
        end
      end
    end
  end
end
