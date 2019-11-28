RSpec.describe ActivePattern::Comparator do
  Test = Struct.new(:key) do
    prepend ActivePattern::Comparator
  end

  describe 'deconstruct' do
    subject { Test.new(:value).deconstruct }

    context 'array stored in global variable' do
      before { $_ACTIVE_PATTERN_MATCHES = [:hoge] }
      after { $_ACTIVE_PATTERN_MATCHES = nil }

      it 'return stored value' do
        is_expected.to eq([:hoge])
      end
    end

    context 'global variable is empty' do
      before { $_ACTIVE_PATTERN_MATCHES = nil }

      it 'return original deconstructed value' do
        is_expected.to eq([:value])
      end
    end
  end
end
