require 'spec_helper'

describe Attendee do
  it { should have_many(:artists).through(:favorites) }

  describe("validations & callbacks") do

    # PRESENCE OF TESTS

    it "checks for the presence of a name" do
      attendee = Attendee.create(name: "", username: "steven-galvin", password: "coolc4t")
      expect(attendee.save).to(eq(false))
    end

    it "checks for the presence of a username" do
      attendee = Attendee.create(name: "Steven", username: "", password: "coolc4t")
      expect(attendee.save).to(eq(false))
    end

    it "checks for the presence of a password" do
      attendee = Attendee.create(name: "Steven", username: "steven-galvin", password: "")
      expect(attendee.save).to(eq(false))
    end

    # USERNAME TESTS

    it "checks username length falls between 6 and 15 characters long" do
      attendee = Attendee.create(name: "Steven", username: "steve", password: "coolc4t")
      expect(attendee.save).to(eq(false))
      attendee2 = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolc4t")
      expect(attendee2.save).to(eq(true))
      attendee3 = Attendee.create(name: "Steven", username: "steven-john-galvin", password: "coolc4t")
      expect(attendee3.save).to(eq(false))
    end

    it "checks uniqueness of username" do
      attendee = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolc4t")
      expect(attendee.save).to(eq(true))
      attendee2 = Attendee.create(name: "Steve", username: "steven-galvin", password: "bonz4i")
      expect(attendee2.save).to(eq(false))
    end

    # PASSWORD TESTS

    it "checks password contains at least one letter and one number" do
      attendee = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolcat")
      expect(attendee.save).to(eq(false))
      attendee2 = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolc4t")
      expect(attendee2.save).to(eq(true))
    end

    it "checks password length falls between 6 and 15 characters long" do
      attendee = Attendee.create(name: "Steven", username: "steven-galvin", password: "cool5")
      expect(attendee.save).to(eq(false))
      attendee2 = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolc4t")
      expect(attendee2.save).to(eq(true))
      attendee3 = Attendee.create(name: "Steven", username: "steven-galvin", password: "coolc4tsarethecoolest")
      expect(attendee3.save).to(eq(false))
    end

    # NAME TESTS

    it "capitalizes users names before saving" do
      attendee = Attendee.create(name: "steven galvin", username: "steven-galvin", password: "coolc4t")
      expect(attendee.name).to(eq("Steven Galvin"))
    end
  end
end
