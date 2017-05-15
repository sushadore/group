require 'spec_helper'

describe Producer do
  describe("validations & callbacks") do

    # PRESENCE OF TESTS

    it "checks for the presence of a name" do
      attendee = Attendee.create(name: "", username: "moinstla", password: "coold0g")
      expect(attendee.save).to(eq(false))
    end

    it "checks for the presence of a username" do
      attendee = Attendee.create(name: "Monique", username: "", password: "coold0g")
      expect(attendee.save).to(eq(false))
    end

    it "checks for the presence of a password" do
      attendee = Attendee.create(name: "Monique", username: "moinstla", password: "")
      expect(attendee.save).to(eq(false))
    end

    # USERNAME TESTS

    it "checks username length falls between 6 and 15 characters long" do
      attendee = Attendee.create(name: "Monique", username: "moins", password: "coold0g")
      expect(attendee.save).to(eq(false))
      attendee2 = Attendee.create(name: "Monique", username: "moinstla", password: "coold0g")
      expect(attendee2.save).to(eq(true))
      attendee3 = Attendee.create(name: "Monique", username: "monique-st-laurent", password: "coold0g")
      expect(attendee3.save).to(eq(false))
    end

    it "checks uniqueness of username" do
      attendee = Attendee.create(name: "Monique", username: "moinstla", password: "coold0g")
      expect(attendee.save).to(eq(true))
      attendee2 = Attendee.create(name: "Steve", username: "moinstla", password: "bonz4i")
      expect(attendee2.save).to(eq(false))
    end

    # PASSWORD TESTS

    it "checks password contains at least one letter and one number" do
      attendee = Attendee.create(name: "Monique", username: "moinstla", password: "cooldog")
      expect(attendee.save).to(eq(false))
      attendee2 = Attendee.create(name: "Monique", username: "moinstla", password: "coold0g")
      expect(attendee2.save).to(eq(true))
    end

    it "checks password length falls between 6 and 15 characters long" do
      attendee = Attendee.create(name: "Monique", username: "moinstla", password: "cool5")
      expect(attendee.save).to(eq(false))
      attendee2 = Attendee.create(name: "Monique", username: "moinstla", password: "coold0g")
      expect(attendee2.save).to(eq(true))
      attendee3 = Attendee.create(name: "Monique", username: "moinstla", password: "coold0gsarethecoolest")
      expect(attendee3.save).to(eq(false))
    end

    # NAME TESTS

    it "capitalizes users names before saving" do
      attendee = Attendee.create(name: "monique st laurent", username: "moinstla", password: "coold0g")
      expect(attendee.name).to(eq("Monique St Laurent"))
    end
  end
end
