require 'spec_helper'

describe package('nfs-common') do
  it {should be_installed}
end
