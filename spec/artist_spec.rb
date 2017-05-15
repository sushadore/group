require 'spec_helper'

describe Artist do
  it { should have_many(:stages).through(:performances) }

  it { should have_and_belong_to_many(:attendees) }

  describe("validations & callbacks") do
    it "checks for the presence of a name" do
      artist = Artist.create(name: "")
      expect(artist.save).to(eq(false))
    end
  end
end
