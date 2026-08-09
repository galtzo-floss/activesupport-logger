require "anonymous_loader"
require "activesupport-logger"
RSpec.describe ActiveSupport::Logger::SimpleFormatter::Version do
  it_behaves_like "a Version module", described_class

  it "executes the version file for coverage without redefining constants" do
    paths = [
      File.expand_path("../../../lib/activesupport/logger/version.rb", __dir__),
      File.expand_path("../../../lib/activesupport/logger/version_gem.rb", __dir__)
    ].select { |path| File.file?(path) }
    anonymous_namespace = AnonymousLoader.load(files: paths)

    expect(anonymous_namespace::ActiveSupport::Logger::SimpleFormatter::Version::VERSION).to eq(described_class::VERSION)
  end

  it "loads without the runtime logger dependency for gemspec evaluation" do
    version_path = File.expand_path("../../../lib/activesupport/logger/version.rb", __dir__)
    logger = Object.send(:remove_const, :Logger)
    anonymous_namespace = Module.new

    Kernel.load(version_path, anonymous_namespace)

    version = anonymous_namespace::ActiveSupport::Logger::SimpleFormatter::Version::VERSION
    expect(version).to eq(described_class::VERSION)
  ensure
    Object.const_set(:Logger, logger) if logger
  end
end
