# frozen_string_literal: true

require 'i18n/tasks'

RSpec.describe I18n do
  let(:i18n) { I18n::Tasks::BaseTask.new }
  let(:missing_keys) { i18n.missing_keys }
  let(:unused_keys) { i18n.unused_keys }
  let(:inconsistent_interpolations) { i18n.inconsistent_interpolations }

  it 'does not have missing keys' do
    message = "Missing #{missing_keys.leaves.count} i18n keys, "
    message += "run `i18n-tasks missing' to show them"
    expect(missing_keys).to be_empty, message
  end

  it 'does not have unused keys' do
    message = "#{unused_keys.leaves.count} unused i18n keys, "
    message += "run `i18n-tasks unused' to show them"
    expect(unused_keys).to be_empty, message
  end

  it 'files are normalized' do
    non_normalized = i18n.non_normalized_paths
    error_message = "The following files need to be normalized:\n" \
                    "#{non_normalized.map { |path| "  #{path}" }.join("\n")}\n" \
                    "Please run `i18n-tasks normalize' to fix"
    expect(non_normalized).to be_empty, error_message
  end

  it 'does not have inconsistent interpolations' do
    error_message = "#{inconsistent_interpolations.leaves.count} i18n keys have "
    error_message += "inconsistent interpolations.\n" \
                    "Run `i18n-tasks check-consistent-interpolations' to show them"
    expect(inconsistent_interpolations).to be_empty, error_message
  end
end
