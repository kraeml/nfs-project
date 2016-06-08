require 'spec_helper'

describe package('nfs-common') do
  it {should be_installed}
end

describe command('showmount -e 192.168.6.4') do
    its(:stdout) { should match /\/var\/nfs\s+192\.168\.6\.3/ }
end
