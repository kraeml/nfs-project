require 'spec_helper'

%w( nfs-common apache2 ).each do |pkgname|
  describe package(pkgname) do
    it {should be_installed}
  end
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/www/pictures') do
  it { should be_directory }
end

describe command('mount') do
  its(:stdout) { should match /192\.168\.6\.4:\/var\/nfs\s+on\s+\/var\/www\/pictures/ }
end

describe file('/etc/fstab') do
  its(:content) { should match /^192\.168\.6\.4/ }
end
