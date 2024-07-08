# spec/spec_helper.rb

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Enable focused test runs with :focus
  config.filter_run_when_matching :focus

  # Allow persistence of example status between runs for --only-failures and --next-failure options
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in this process using the --seed CLI option.
  Kernel.srand config.seed

  # Print the 10 slowest examples and example groups at the end of the spec run
  config.profile_examples = 10

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Use documentation formatter for detailed output if running a single spec file
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
end

