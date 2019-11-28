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

  Point = Struct.new(:x, :y) do
    def deconstruct_keys(_keys)
      { x: x, y: y }
    end
  end

  describe 'array pattern' do
    module CoordinatesA
      extend ActivePattern::Context[Point]
      Cartesian = pattern { [x, y] }
      Polar = pattern { [Math.sqrt(x ** 2 + y ** 2), Math.atan2(x, y)] }
    end

    it 'deconstruct by matched pattern' do
      case Point.new(1, 1)
      in CoordinatesA::Cartesian[x, y]
        expect(x).to eq(1)
        expect(y).to eq(1)
      else; fail
      end

      case Point.new(1, 1)
      in CoordinatesA::Polar[r, theta]
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

  describe 'hash pattern' do
    module CoordinatesH
      extend ActivePattern::Context[Point]
      Cartesian = pattern { { x: x, y: x } }
      Polar = pattern { { r: Math.sqrt(x ** 2 + y ** 2), degree: Math.atan2(x, y) } }
    end

    it 'deconstruct by matched pattern' do
      case Point.new(1, 1)
      in CoordinatesH::Cartesian(x: x, y: y)
        expect(x).to eq(1)
        expect(y).to eq(1)
      else; fail
      end

      case Point.new(1, 1)
      in CoordinatesH::Polar(r: r, degree: theta)
        expect(r).to eq(Math.sqrt(2))
        expect(theta).to eq(Math::PI / 4)
      else; fail
      end
    end

    it 'can deconstruct by original' do
      case Point.new(1, 1)
      in { x: x, y: y }
        expect(x).to eq(1)
        expect(y).to eq(1)
      else; fail
      end
    end
  end
end
