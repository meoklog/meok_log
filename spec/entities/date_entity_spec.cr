
require "./spec_helper"

describe MeokLog::Entities::Date do
  # subject { MeokLog::Entities::Date.new }

  describe "#initialize" do
    describe "when year is valid" do
      describe "when month is valid" do
        describe "when day is valid" do
          it "save a date" do
            subject = MeokLog::Entities::Date.new(2016, 10, 22)
            expect(subject.year).to eq 2016
            expect(subject.month).to eq 10
            expect(subject.day).to eq 22
          end
        end
      end
    end
  end
end
