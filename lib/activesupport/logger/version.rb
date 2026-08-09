# frozen_string_literal: true

module ActiveSupport
  # The gemspec loads this file before runtime dependencies are installed.
  # Keep the version namespace loadable in that context while retaining the
  # normal Logger inheritance when the library itself has been loaded.
  class Logger
    formatter_superclass = if defined?(::Logger::Formatter)
      ::Logger::Formatter
    else
      Object
    end

    class SimpleFormatter < formatter_superclass
      # Version namespace for this gem.
      module Version
        # Current gem version.
        VERSION = "2.0.4"
      end
      # Current gem version exposed at the traditional constant location.
      VERSION = Version::VERSION # Traditional Constant Location
    end
  end
end
