require "spec_helper"

describe Performance do
  it { should belong_to :artist }
  it { should belong_to :stage }
end
