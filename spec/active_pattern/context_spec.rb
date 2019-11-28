RSpec.describe ActivePattern::Context do
  module Order
    extend ActivePattern::Context[Integer]
    ODD = pattern { self % 2 != 0 }
  end

  it 'match if class and pattern block are both satisfied' do
    case 1
    in Order::ODD; true
    else; fail
    end
  end

  it 'not match if pattern block is not satisfied' do
    case 2
    in Order::ODD; fail
    else; true
    end
  end

  it 'not match if class is different' do
    case 1.0
    in Order::ODD; fail
    else; true
    end
  end
end
