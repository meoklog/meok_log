
require "./spec_helper"

describe MeokLog::EntityAggregators::Stat do
  describe "#initialize" do
    describe "when entity date is set" do
      # before { date_entity = MeokLog::Entities::Date.new(2016, 10, 20) }
      describe "when entity mood is set" do
        # before { mood_entity = MeokLog::Entities::Mood.new("bon", 0) }
        describe "when work entity is set" do
          # before { work_entity = MeokLog::Entities::Work.new(true) }
          describe "when entity draw is nil" do
            # before { draw_entity = nil }
            describe "when entity stream is nil" do
              # before { stream_entity = nil }
              it "save a stat" do
                date_entity = MeokLog::Entities::Date.new(2016, 10, 20)
                mood_entity = MeokLog::Entities::Mood.new("bon", 0)
                work_entity = MeokLog::Entities::Work.new(true)
                draw_entity = nil
                stream_entity = nil
                subject = MeokLog::EntityAggregators::Stat.new(date_entity,
                                                                           mood_entity,
                                                                           work_entity,
                                                                           draw_entity,
                                                                           stream_entity)
                expect(subject.date).to be_a MeokLog::Entities::Date
                expect(subject.mood).to be_a MeokLog::Entities::Mood
                expect(subject.work).to be_a MeokLog::Entities::Work
                expect(subject.draw).to eq nil
                expect(subject.stream).to eq nil
              end
            end
          end
        end
      end
    end
  end
end
