require 'spec_helper'

describe package('nfs-kernel-server') do
  it {should be_installed}
end

describe package('apache2') do
  it { should_not be_installed }
end

describe file('/var/nfs') do
  it { should be_directory }
end

describe file('/etc/exports') do
  it { should be_file }
  its(:content) { should match /^\/var\/nfs/ }
end

describe service('nfs-kernel-server') do
  it { should be_enabled }
  it { should be_running }
end

describe command('exportfs') do
  its(:stdout) { should match /\/var\/nfs\s+192\.168\.6\.3/ }
end
