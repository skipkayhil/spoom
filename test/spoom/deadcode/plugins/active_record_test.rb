# typed: true
# frozen_string_literal: true

require "test_with_project"
require "helpers/deadcode_helper"

module Spoom
  module Deadcode
    module Plugins
      class ActiveRecordTest < TestWithProject
        include Test::Helpers::DeadcodeHelper

        def test_ignore_migration_classes
          @project.write!("db/migrate/20230101000000_create_model.rb", <<~RB)
            class CreateModel < ActiveRecord::Migration[7.0]
              def change; end
              def down; end
              def up; end
            end
          RB

          index = index_with_plugins
          assert_ignored(index, "change")
          assert_ignored(index, "down")
          assert_ignored(index, "up")
        end

        private

        sig { returns(Index) }
        def index_with_plugins
          deadcode_index(plugins: [ActiveRecord.new])
        end
      end
    end
  end
end