require "spec_helper"

describe Favorite do
  it { should belong_to :artist }
  it { should belong_to :attendee }
end
