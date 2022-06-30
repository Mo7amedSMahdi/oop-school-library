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

  context 'Testing solver class => fizzbuzz' do
    it 'When N is divisible by 3, returns fizz' do
      calc = Solver.new
      @fizzbuzz = calc.fizzbuzz(3)
      expect(@fizzbuzz).to eq('fizz')
    end

    it 'When N is divisible by 5, returns buzz' do
      @fizzbuzz = solver.fizzbuzz(5)
      expect(@fizzbuzz).to eq('buzz')
    end

    it 'When N is divisible by 3 and 5, returns fizzbuzz' do
      @fizzbuzz = solver.fizzbuzz(15)
      expect(@fizzbuzz).to eq('fizzbuzz')
    end

    it 'Any other case, return N as a string' do
      @fizzbuzz = solver.fizzbuzz(4)
      expect(@fizzbuzz).to eq('4')
    end
  end
end