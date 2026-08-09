# Prevent Active Support from loading its own logger implementation. Loading
# the implementation through this feature path also keeps Ruby's require
# tracking consistent when Rails is loaded before or after this gem.
require_relative "../activesupport/logger"
