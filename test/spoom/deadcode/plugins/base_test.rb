# typed: true
# frozen_string_literal: true

require "test_with_project"
require "helpers/deadcode_helper"

module Spoom
  module Deadcode
    module Plugins
      class BaseTest < TestWithProject
        include Test::Helpers::DeadcodeHelper

        # on_* methods

        def test_on_define_accessor
          plugin = Class.new(Base) do
            def on_define_accessor(indexer, definition)
              definition.ignored! if definition.name == "attr_reader1"
            end
          end

          @project.write!("foo.rb", <<~RB)
            attr_reader :attr_reader1
            attr_reader :attr_reader2
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_ignored(index, "attr_reader1")
          refute_ignored(index, "attr_reader2")
        end

        def test_on_define_class
          plugin = Class.new(Base) do
            def on_define_class(indexer, definition)
              definition.ignored! if definition.name == "Class1"
            end
          end

          @project.write!("foo.rb", <<~RB)
            class Class1; end
            class Class2; end
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_ignored(index, "Class1")
          refute_ignored(index, "Class2")
        end

        def test_on_define_constant
          plugin = Class.new(Base) do
            def on_define_constant(indexer, definition)
              definition.ignored! if definition.name == "CONST1"
            end
          end

          @project.write!("foo.rb", <<~RB)
            CONST1 = 1
            CONST2 = 2
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_ignored(index, "CONST1")
          refute_ignored(index, "CONST2")
        end

        def test_on_define_method
          plugin = Class.new(Base) do
            def on_define_method(indexer, definition)
              definition.ignored! if definition.name == "method1"
            end
          end

          @project.write!("foo.rb", <<~RB)
            def method1; end
            def method2; end
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_ignored(index, "method1")
          refute_ignored(index, "method2")
        end

        def test_on_define_module
          plugin = Class.new(Base) do
            def on_define_module(indexer, definition)
              definition.ignored! if definition.name == "Module1"
            end
          end

          @project.write!("foo.rb", <<~RB)
            module Module1; end
            module Module2; end
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_ignored(index, "Module1")
          refute_ignored(index, "Module2")
        end

        def test_on_send
          plugin = Class.new(Base) do
            def on_send(indexer, send)
              return unless send.name == "dsl_method"
              return if send.args.empty?

              method_name = indexer.node_string(send.args.first).delete_prefix(":")
              indexer.reference_method(method_name, send.node)
            end
          end

          @project.write!("foo.rb", <<~RB)
            dsl_method :method1
            dsl_method :method2

            def method1; end
            def method2; end
            def method3; end
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_alive(index, "method1")
          assert_alive(index, "method2")
          assert_dead(index, "method3")
        end

        # ignore_*_named DSL

        def test_ignore_classes_named
          plugin = Class.new(Base) do
            ignore_classes_named(
              "Class1",
              "Class2",
              /^ClassRE.*/,
            )
          end

          @project.write!("foo.rb", <<~RB)
            class Class1; end
            class Class2; end
            class Class3; end
            class ClassRE1; end
            class ClassRE2; end
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_ignored(index, "Class1")
          assert_ignored(index, "Class2")
          refute_ignored(index, "Class3")
          assert_ignored(index, "ClassRE1")
          assert_ignored(index, "ClassRE2")
        end

        def test_ignore_methods_named
          plugin = Class.new(Base) do
            ignore_methods_named(
              "name1",
              "name2",
              /^name_re.*/,
            )
          end

          @project.write!("foo.rb", <<~RB)
            def name1; end
            def name2; end
            def name3; end
            def name_regexp1; end
            def name_regexp2; end
          RB

          index = deadcode_index(plugins: [plugin.new])
          assert_ignored(index, "name1")
          assert_ignored(index, "name2")
          refute_ignored(index, "name3")
          assert_ignored(index, "name_regexp1")
          assert_ignored(index, "name_regexp2")
        end
      end
    end
  end
end
