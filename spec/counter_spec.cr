
require "./spec_helper"
require "../src/meok_log/counter"

describe MeokLog::Counter do
  # @FIX : subject not working, seems a crystal fault
  # subject { MeokLog::Counter.new }

  it "#initialize" do
    subject = MeokLog::Counter.new
    expect(subject.count).to eq 0
  end

  it "#increments" do
    subject = MeokLog::Counter.new
    subject.increments
    expect(subject.count).to eq 1
  end
end
