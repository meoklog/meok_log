
require "./spec_helper.cr"

describe MeokLog::Reducers::PairDate do
  it "#initialize" do
    subject = MeokLog::Reducers::PairDate.new
  end
  describe "#to_pairs" do
    describe "when there is yaml meta data" do
      describe "when date property is set" do
        it "should reduce to an array of pairs(date, value)" do
          now = Time.now
          tomorrow = Time.new(now.year, now.month, now.day + 1)
          data = [
            {
              stress: 0,
              humeur: "normal",
              date: now.to_s
            },
            {
              stress: 3,
              humeur: "pas bon",
              date: tomorrow.to_s

            }
          ]
          yaml_data = data.map { |d| YAML.parse(YAML.dump(d)) }
          subject = MeokLog::Reducers::PairDate.new("date", yaml_data)
          expect(subject.to_pairs("stress")).to be_a Array({date: String, value: String})
        end
      end
    end
  end

end
