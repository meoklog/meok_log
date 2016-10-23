
require "./spec_helper"
require "yaml"
require "markdown"

describe MeokLog::Providers::Content do
  describe "#parse" do
    describe "when parser is Yaml" do
      it "transforms into hash" do
        contents =  "---\nhello: true\n---".to_s
        parser = -> (content : String) { YAML.parse content }
        subject = MeokLog::Providers::Content
        results = subject.parse(contents, parser)
        expect(results["hello"].to_s).to eq true.to_s
      end
    end

    describe "when parser is markdown" do
      it "transforms into html" do
        contents = "# summary \n _hello_"
        parser = -> (content : String) { Markdown.to_html content }
        subject = MeokLog::Providers::Content
        results = subject.parse(contents, parser)
        expect(results.to_s).to eq "<h1>summary </h1>\n\n<p><em>hello</em></p>"
      end
    end
  end
end
