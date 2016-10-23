
describe MeokLog::Providers::MdYaml do
  describe "#parse" do
    describe "when markdown contents" do
      describe "when yaml meta data" do
        it "parse contents" do
          contents = "---\ntravail: false\nhumeur: dépassé par les évènements\nstress: 1\ndate: 2016-10-20\n---\n\n- 3ds max\n"
          subject = MeokLog::Providers::MdYaml
          result = subject.parse(contents)
          expect(result["md"]).to be_a String
        end
      end
    end
  end
end
