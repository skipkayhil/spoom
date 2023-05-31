# typed: strict
# frozen_string_literal: true

module Spoom
  module Deadcode
    module Plugins
      class ActiveJob < Base
        ignore_method_names("perform", "build_enumerator", "each_iteration")
      end
    end
  end
end
