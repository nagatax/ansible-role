require 'spec_helper'
require File.join( File.dirname(__FILE__), '../lib/package.rb' )

describe yumrepo('epel') do
  it { should exist }
end

describe yumrepo('remi') do
  it { should exist }
end

package_name = Package.getPackageName( 'redis', os[:family], Package::NAME )
describe package(package_name) do
  it { should be_installed}
end

service_name = Package.getPackageName( 'redis', os[:family], Package::DAEMON )
describe service(service_name) do
  it { should be_enabled }
  it { should be_running }
end

describe port(6379) do
  it { should be_listening }
end
