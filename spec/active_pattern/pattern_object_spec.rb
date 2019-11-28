RSpec.describe ActivePattern::PatternObject do
  describe 'equality pattern' do
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

  describe 'array pattern' do
    subject { described_class.new(String, Proc.new { split('') }) }
    after { $_ACTIVE_PATTERN_MATCHES = nil }

    it 'set global variable if matched' do
      is_expected.to be === 'ab'
      expect($_ACTIVE_PATTERN_MATCHES).to eq(['a', 'b'])
    end

    it 'not set global variable if not matched' do
      is_expected.not_to be === [1, 2, 3]
      expect($_ACTIVE_PATTERN_MATCHES).to be_nil
    end
  end
end
