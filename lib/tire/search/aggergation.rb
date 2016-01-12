module Tire
  module Search

    class Aggergation

      def initialize(aggregation_name, aggregation_type, aggregation_body={}, &block)
        @aggregation_name     = aggregation_name
        @aggregation_type     = aggregation_type
        @aggregation_body     = aggregation_body
        block.arity < 1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def to_json(options={})
        to_hash.to_json
      end

      def to_hash
        { @aggregation_name => { @aggregation_type => @aggregation_body }}
      end
    end

  end
end
