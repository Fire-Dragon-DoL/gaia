require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "yaml"
  gem "pathname"
end


require "pathname"
boot_dir = File.expand_path("../", __dir__)
puts boot_dir.to_s
APP_ROOT = Pathname.new(boot_dir)

module Shell
  extend self

  def system(...)
    ::Kernel.system(...)
  end
end
