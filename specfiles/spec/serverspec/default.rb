require 'spec_helper'

apt_packages = %w(
  rake
  ruby2.3
  ruby2.3-dev
)

gem_packages = ['serverspec', 'serverspec-runner']

apt_packages.each do |paket|
  describe package(paket) do
    it { should be_installed }
  end
end

gem_packages.each do |paket|
  describe package(paket) do
    it { should be_installed.by('gem') }
  end
end
