# typed: true
# frozen_string_literal: true

require "test_with_project"
require "helpers/deadcode_helper"

module Spoom
  module Deadcode
    module Plugins
      class MinitestTest < TestWithProject
        include Test::Helpers::DeadcodeHelper

        def test_ignore_minitest_methods
          @project.write!("test/foo_test.rb", <<~RB)
            class FooTest
              def after_all; end
              def around; end
              def around_all; end
              def before_all; end
              def setup; end
              def teardown; end
            end
          RB

          index = index_with_plugins
          assert_ignored(index, "after_all")
          assert_ignored(index, "around")
          assert_ignored(index, "around_all")
          assert_ignored(index, "before_all")
          assert_ignored(index, "setup")
          assert_ignored(index, "teardown")
        end

        private

        sig { returns(Deadcode::Index) }
        def index_with_plugins
          deadcode_index(plugins: [Plugins::Minitest.new])
        end
      end
    end
  end
end