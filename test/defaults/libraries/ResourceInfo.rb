require "inspec/resources/file"
require "inspec/utils/filter"
require "inspec/resources/command"
require "resourcelib"

module Inspec::Resources
class ResourceInfo < Inspec.resource(1)
  name "resourceinfo"
  supports platform: 'redhat', release: '7.7'
  desc "Use the resource_info InSpec resource to test the no. of CPU, Memory and Disks in VM."

  #Usage
  # Filter for a specific resource by name
  # Memtotal, nproc and disk

  example <<~EXAMPLE
    describe resourceinfo  do
      its ('nproc') { should eq 2 }
    end
    describe resourceinfo do
       its ('MemTotal') { should cmp '/proc/meminfo' }
    end
    describe resourceinfo do
      its ('disk') { should cmp 'lsblk -io KNAME,TYPE,SIZE,MODEL' }
    end
  EXAMPLE

  attr_reader :nproc, :MemTotal, :disk

  def initialize(opts={})
    @opts = opts
  end

