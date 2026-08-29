require "anonymous_loader"
require "logger"
require "activesupport-logger"
# The version spec remains beside the historical runtime path while exercising
# the standalone gemspec version namespace.
# rubocop:disable RSpec/SpecFilePathFormat
RSpec.describe ActiveSupport::Logger::Version do
  it_behaves_like "a Version module", described_class

  it "attaches the version module to the inherited Logger namespace" do
    expect(ActiveSupport::Logger.superclass).to eq(::Logger)
    expect(ActiveSupport::Logger::Version).to be(described_class)
  end

  it "executes the version file for coverage without redefining constants" do
    paths = [
      File.expand_path("../../../lib/activesupport/logger/version.rb", __dir__),
      File.expand_path("../../../lib/activesupport/logger/version_gem.rb", __dir__)
    ].select { |path| File.file?(path) }
    anonymous_namespace = AnonymousLoader.load(files: paths)

    expect(anonymous_namespace::ActiveSupport::Logger::Version::VERSION).to eq(described_class::VERSION)
  end
end
# rubocop:enable RSpec/SpecFilePathFormat
