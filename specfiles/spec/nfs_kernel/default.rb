require 'spec_helper'

describe package('nfs-kernel-server') do
  it {should be_installed}
end
