# frozen_string_literal: true

RSpec.describe "Active Support logger loading" do
  it "loads the extracted logger through the active_support/logger entrypoint" do
    expect($LOADED_FEATURES).to include(a_string_ending_with("active_support/logger.rb"))
    expect(ActiveSupport::Logger.superclass).to eq(Logger)
  end
end
