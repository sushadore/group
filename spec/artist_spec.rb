require 'spec_helper'

describe Artist do
  it { should have_many(:stages).through(:performances) }
end
