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
end
