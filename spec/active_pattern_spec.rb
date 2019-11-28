RSpec.describe ActivePattern do
  describe 'inline context' do
    EVEN = ActivePattern[Integer].pattern { self % 2 == 0 }

    it 'match if class and pattern block are both satisfied' do
      case 2
      in EVEN; true
      else; fail
      end
    end

    it 'not match if pattern block is not satisfied' do
      case 1
      in EVEN; fail
      else; true
      end
    end

    it 'not match if class is different' do
      case 2.0
      in EVEN; fail
      else; true
      end
    end
  end
end
