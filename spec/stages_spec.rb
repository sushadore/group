require 'spec_helper'

describe Stage do
  it { should have_many(:artists).through(:performances) }
end
