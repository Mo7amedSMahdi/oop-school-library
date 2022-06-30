require './solver'

describe Solver do
    solver = Solver.new
    context 'testing solver class factorial methods' do
        it 'Returns an instance of the solver class' do
      @our_factorial = solver.factorial(2)
      expect(@our_factorial).to eq(2)
    end

    it 'It should raise error for negative numbers' do
      @our_factorial = solver.factorial(-1)
      expect(@our_factorial).to eq 'Can not have factorial of a negative number'
    end
    end
end