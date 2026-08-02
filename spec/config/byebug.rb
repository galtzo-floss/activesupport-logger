begin
  require "debug" if ENV.fetch("DEBUG", "false").casecmp?("true")
rescue LoadError
  # Debugging is optional and may be unavailable in legacy appraisal bundles.
  nil
end
