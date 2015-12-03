require 'spec_helper'
require 'invariant'

class Example
  extend Invariant

  def self.run(_)
    { foo: :bar }
  end

  def self.run!(_)
    { baz: :bang }
  end
end

describe Invariant do
  let(:check) do
    Proc.new { |x| x.fetch(:foo) == :bar }
  end

  subject(:ok) do
    r = Example.run_with_invariants &check
  end

  subject(:bad) do
    r = Example.run_with_invariants! do |x|
      x.fetch(:baz) == :nope
    end
  end

  it "should work" do
    expect(ok).to eq(foo: :bar)
  end

  it "should fail" do
    expect { bad }.to raise_error(Invariant::INVARIANT_FAILED)
  end
end
