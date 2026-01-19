require 'dotenv'

Dotenv.load

# Boot file for non-Rails contexts. Sets load path and loads initializers.
begin
  require 'bundler/setup'
rescue LoadError
  # bundler not available; continue
end

# Ensure project lib/ is on the load path
lib_path = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_path) unless $LOAD_PATH.include?(lib_path)

# Load any initializers from config/initializers
init_dir = File.expand_path('initializers', __dir__)
if Dir.exist?(init_dir)
  Dir[File.join(init_dir, '*.rb')].sort.each do |f|
    require f
  end
end

# Optional: expose a simple method to check boot was loaded
module Langlearn
  def self.booted?
    true
  end
end
