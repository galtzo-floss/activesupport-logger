# frozen_string_literal: true

RSpec.describe ActiveSupport::Logger do
  it "loads the extracted logger through the active_support/logger entrypoint" do
    expect(described_class.superclass).to eq(Logger)
  end
end
