# frozen_string_literal: true

task demo: :environment do
  # NOTE: reload to make sure that record has `external_id` attribute initialized
  parent = Parent.create!.reload
  Child.create!(parent: parent)

  # NOTE: This one does not work as expected
  # Expected behavior - returns a record
  # Actual behavior - returns nil
  Child.
    find_by(parent: parent).
    tap { |child| puts "find_by parent association: #{child.presence.inspect}" }

  # NOTE: Adding joins solves and issue
  Child.
    joins(:parent).
    find_by(parent: parent).
    tap { |child| puts "find_by parent association with join: #{child.presence}" }

  # NOTE: Search by explicit id also works as expected
  Child.
    find_by(parent_id: parent.external_id).
    tap { |child| puts "find_by parent external_id: #{child.presence}" }
end
