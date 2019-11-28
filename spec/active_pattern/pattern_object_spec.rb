RSpec.describe ActivePattern::PatternObject do
  subject { described_class.new(Integer, Proc.new { self % 2 == 0 }) }

  it 'match if class and pattern block are both satisfied' do
    is_expected.to be === 2
  end

  it 'not match if pattern block is not satisfied' do
    is_expected.not_to be === 1
  end

  it 'not match if class is different' do
    is_expected.not_to be === 2.0
  end
end
