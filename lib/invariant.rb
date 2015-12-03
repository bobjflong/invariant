require 'invariant/version'

module Invariant
  INVARIANT_FAILED = Class.new(StandardError)

  def run_with_invariants(x = nil)
    result = self.send(:run, x)
    yield(result) ? result : (fail INVARIANT_FAILED)
  end

  def run_with_invariants!(x = nil)
    result = self.send(:run!, x)
    yield(result) ? result : (fail INVARIANT_FAILED)
  end
end
