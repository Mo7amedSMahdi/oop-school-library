require './solver'

describe Solver do
    solver = Solver.new
    context 'Testing solver class => factorial methods' do
        it 'Returns an instance of the solver class' do
      @our_factorial = solver.factorial(2)
      expect(@our_factorial).to eq(2)
    end

    it 'It should raise error for negative numbers' do
      @our_factorial = solver.factorial(-1)
      expect(@our_factorial).to eq 'Can not have factorial of a negative number'
    end
    end

     context 'Testing solver class => reverse' do
    it 'Returns an instance of the solver class' do
      @reversed_word = solver.reverse('hello')
      expect(@reversed_word).to eq('olleh')
    end

    it 'Returns an instance of the solver class' do
      @reversed_word = solver.reverse('eye')
      expect(@reversed_word).to eq('eye')
    end
  end
end