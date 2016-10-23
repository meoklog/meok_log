
require "./spec_helper"

describe MeokLog::Entities::Stream do
  describe  "#initialize" do
    describe "when hours is set to 1" do
      describe "when minutes is set to 30" do
        describe "when seconds is empty" do
          it "save a stream" do
            subject = MeokLog::Entities::Stream.new(1, 30)
            expect(subject.hours).to eq 1
            expect(subject.minutes).to eq 30
            expect(subject.seconds).to eq 0
          end
        end
      end
    end
  end
end
