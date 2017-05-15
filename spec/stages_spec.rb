require 'spec_helper'

describe Stage do
  it { should have_many(:artists).through(:performances) }

  describe("validations & callbacks") do
    it "checks for the presence of name" do
      stage = Stage.create(name: "")
      expect(stage.save).to(eq(false))
    end
  end
end
