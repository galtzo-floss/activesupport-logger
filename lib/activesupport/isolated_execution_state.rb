# frozen_string_literal: true

module ActiveSupport
  module IsolatedExecutionState # :nodoc:
    @isolation_level = nil

    Thread.attr_accessor(:active_support_execution_state)
    Fiber.attr_accessor(:active_support_execution_state)

    class << self
      attr_reader :isolation_level, :scope

      def isolation_level=(level)
        return if level == @isolation_level

        unless %i[thread fiber].include?(level)
          raise ArgumentError, "isolation_level must be `:thread` or `:fiber`, got: `#{level.inspect}`"
        end

        clear if @isolation_level

        @scope =
          case level
          when :thread then Thread
          when :fiber then Fiber
          end

        @isolation_level = level
      end

      def unique_id
        self[:__id__] ||= Object.new
      end

      def [](key)
        state[key]
      end

      def []=(key, value)
        state[key] = value
      end

      def key?(key)
        state.key?(key)
      end

      def delete(key)
        state.delete(key)
      end

      def clear
        state.clear
      end

      def context
        scope.current
      end

      def share_with(other)
        # Action Controller streaming spawns a new thread and copy thread locals.
        # We do the same here for backward compatibility, but this is very much a hack
        # and streaming should be rethought.
        set_state(context, state_for(other).dup)
      end

      private

      def state
        state_for(context) || set_state(context, {})
      end

      def state_for(target)
        if scope == Thread
          target.thread_variable_get(:active_support_execution_state)
        else
          target.active_support_execution_state
        end
      end

      def set_state(target, value)
        if scope == Thread
          target.thread_variable_set(:active_support_execution_state, value)
        else
          target.active_support_execution_state = value
        end
      end
    end

    self.isolation_level = :thread
  end
end
