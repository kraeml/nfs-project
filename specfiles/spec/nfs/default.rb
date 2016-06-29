require 'spec_helper'

describe package('nfs_kernel-server') do
  it { should be_installed }
end
