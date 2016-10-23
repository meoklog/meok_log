
require "./spec_helper"

describe MeokLog::Parsers::MdMeta do
  describe "#reject" do
    describe "when contains meta" do
      it "reject the meta" do
        contents = "---\ntravail: false\nhumeur: dépassé par les évènements\nstress: 1\ndate: 2016-10-20\n---\n\n- 3ds max\n"
        subject = MeokLog::Parsers::MdMeta
        expect(subject.reject(contents)).to match /^\n- 3ds max\n\n/
      end
    end
  end
end
