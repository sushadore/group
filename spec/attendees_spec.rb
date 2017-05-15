require 'spec_helper'

describe Attendee do
  it { should have_and_belong_to_many(:artists) }

  describe("validations & callbacks") do
    it "checks for the presence of a name" do
      attendee = Attendee.create(name: "")
      expect(attendee.save).to(eq(false))
    end

    it "checks for the presence of a username" do
      attendee = Attendee.create(name: "Steven", username: "")
      expect(attendee.save).to(eq(false))
    end

    it "checks for the presence of a password" do
      attendee = Attendee.create(name: "Steven", username: "steven-galvin", password: "")
      expect(attendee.save).to(eq(false))
    end

    it "checks password contains at least one letter and one number" do
      attendee = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolcat")
      expect(attendee.save).to(eq(false))
    end

    it "checks password contains at least one letter and one number" do
      attendee2 = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolc4t")
      expect(attendee2.save).to(eq(true))
    end
  end
end
