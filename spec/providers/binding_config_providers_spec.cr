
require "./spec_helper"

describe MeokLog::Providers::BindingConfig do
  it "initialize" do
    yaml_file = "./config/bindings.yaml"
    subject = MeokLog::Providers::BindingConfig.new(yaml_file)
    expect(subject.file).to be_a(String)
  end
  describe "#write" do
    describe "when there is no config file" do
      describe "when config is in data folder" do
        it "should write yaml" do
          writer = -> (payload : Tuple(String, String)) { payload[1] }
          content = ["stress", "travail", "base"]
          yaml_file = "./config/bindings.yaml"
          subject = MeokLog::Providers::BindingConfig.new(yaml_file)
          expect(subject.write(content, writer).size).not_to eq(0)
        end
      end
    end
  end
end
