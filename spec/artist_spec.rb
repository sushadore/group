require 'spec_helper'

describe Artist do
  it { should have_many(:stages).through(:performances) }

  it { should have_many(:attendees).through(:favorites) }

  describe("validations & callbacks") do
    it "checks for the presence of a name" do
      artist = Artist.create(name: "", bio: "A cool band", user_reviews: "a".*(101))
      expect(artist.save).to(eq(false))
    end

    it "checks for the presence of a bio" do
      artist = Artist.create(name: "Gorillaz", bio: "", user_reviews: "a".*(101))
      expect(artist.save).to(eq(false))
    end

    it "checks review length falls between 10 and 280 characters long" do
      artist = Artist.create(name: "Gorillaz", bio: "A cool band", user_reviews: "a".*(101))
      expect(artist.save).to(eq(true))
      artist2 = Artist.create(name: "Logic", bio: "A rad dude", user_reviews: "a".*(281))
      expect(artist2.save).to(eq(false))
      artist3 = Artist.create(name: "Harry Styles", bio: "A cool dude", user_reviews: "a".*(9))
      expect(artist3.save).to(eq(false))

    end
  end
end
