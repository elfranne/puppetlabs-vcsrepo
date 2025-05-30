# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '..', 'vcsrepo')

Puppet::Type.type(:vcsrepo).provide(:dummy, parent: Puppet::Provider::Vcsrepo) do
  desc 'Dummy default provider'

  defaultfor feature: :posix
  defaultfor 'os.name': :windows

  def working_copy_exists?
    providers = begin
      @resource.class.providers.map(&:to_s).sort.reject { |x| x == 'dummy' }.join(', ')
                rescue StandardError
                  'none'
    end
    raise("vcsrepo resource must have a provider, available: #{providers}")
  end
end
