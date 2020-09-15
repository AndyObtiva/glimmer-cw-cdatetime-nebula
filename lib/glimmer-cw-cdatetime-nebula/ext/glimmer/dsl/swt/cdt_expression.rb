require 'glimmer/dsl/static_expression'
require 'glimmer-cw-cdatetime-nebula/ext/glimmer/swt/cdt_proxy'

module Glimmer
  module DSL
    module SWT
      # Extends Glimmer DSL to easily build CDT constant values with `cdt(arg)`
      #
      # Named CdtExpression (not CDTExpression) so that the DSL engine
      # discovers quickly by convention
      class CdtExpression < StaticExpression
        def can_interpret?(parent, keyword, *args, &block)
          block.nil? &&
            args.size > 0
        end
  
        def interpret(parent, keyword, *args, &block)
          Glimmer::SWT::CDTProxy[*args]
        end
      end
    end
  end
end
