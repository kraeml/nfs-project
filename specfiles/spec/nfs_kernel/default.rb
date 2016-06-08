require 'spec_helper'

describe package('nfs-kernel-server') do
  it {should be_installed}
end


describe service('nfs-kernel-server') do
  it { should be_running }
end

describe file('/var/nfs') do
  it { should be_directory }
  it { should be_owned_by 'vagrant' }
  it { should be_grouped_into 'vagrant' }
  it { should be_executable.by_user('vagrant') }
  it { should be_writable.by_user('vagrant') }
  it { should be_readable.by_user('vagrant') }
end

describe file('/etc/exports') do
  it { should be_file }
  its(:content) { should match /^\/var\/nfs/ }
end
describe command('showmount -e localhost') do
  its(:stdout) { should match /\/var\/nfs\s+192\.168\.6\.3/ }
end
