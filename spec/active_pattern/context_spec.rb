RSpec.describe ActivePattern::Context do
  describe 'equality pattern' do
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

  describe 'array pattern' do
    Point = Struct.new(:x, :y)
    module Coordinates
      extend ActivePattern::Context[Point]
      Cartesian = pattern { [x, y] }
      Polar = pattern { [Math.sqrt(x ** 2 + y ** 2), Math.atan2(x, y)] }
    end

    it 'deconstruct by matched pattern' do
      case Point.new(1, 1)
      in Coordinates::Cartesian[x, y]
        expect(x).to eq(1)
        expect(y).to eq(1)
      else; fail
      end

      case Point.new(1, 1)
      in Coordinates::Polar[r, theta]
        expect(r).to eq(Math.sqrt(2))
        expect(theta).to eq(Math::PI / 4)
      else; fail
      end
    end

    it 'can deconstruct by original' do
      case Point.new(1, 1)
      in [x, y]
        expect(x).to eq(1)
        expect(y).to eq(1)
      else; fail
      end
    end
  end
end
