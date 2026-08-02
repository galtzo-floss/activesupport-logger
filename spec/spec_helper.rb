# Loading "active_support" normally here ensures this library will work,
#   even if loaded after the vanilla ActiveSupport.
# Unfortunately, it also results in 0% code coverage, because this gem gets loaded too early.
# require "active_support"

# External Deps
require "minitest"
require "test-unit"
require "rspec/pending_for"
require "active_support/core_ext/enumerable"

# Extensions of test-unit
require "active_support/testing/assertions"

# RSpec Configs
require_relative "config/byebug"
require_relative "config/rspec/rspec_block_is_expected"
require_relative "config/rspec/rspec_core"
require_relative "config/rspec/version_gem"
require_relative "config/testing_assertions"
require_relative "support/helpers/multibyte_test_helpers"

# Last thing before loading this gem is to set up code coverage
begin
  require "kettle-soup-cover"
  if Kettle::Soup::Cover::DO_COV
    # Requiring simplecov loads the project-local `.simplecov`.
    require "simplecov"
    require "kettle/soup/cover/config"
    SimpleCov.start
  end
  #   this next line has a side effect of running `.simplecov`
rescue LoadError
  # check the error message and re-raise when unexpected
  nil
end

# External RSpec & related config
require "kettle/test/rspec"
# `kettle/test/rspec` installs harness helpers documented in spec/README.md.
# This library
require "activesupport-logger"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
# The sibling extracted gem is needed because Rails' tests for active_support/logger depend on the active_support/broadcast_logger
# We have to load it after the gem-under-test because it depends on the gem-under-test (a circular-dev-runtime-dep)
require "activesupport-broadcast_logger"
