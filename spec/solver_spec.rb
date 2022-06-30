require './solver'

describe Solver do
  solver = Solver.new
  context 'Testing solver class => factorial methods' do
    it 'Returns an instance of the solver class' do
      @our_factorial = solver.factorial(5)
      expect(@our_factorial).to eq(120)
    end

    it 'It should raise error for negative numbers' do
      @our_factorial = solver.factorial(-1)
      expect(@our_factorial).to eq 'Can not have factorial of a negative number'
    end

    it 'It should return 1 if n= zero' do
      @our_factorial = solver.factorial(0)
      expect(@our_factorial).to eq(1)
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
      @fizzbuzz = calc.fizz_buzz(3)
      expect(@fizzbuzz).to eq('fizz')
    end

    it 'When N is divisible by 5, returns buzz' do
      @fizzbuzz = solver.fizz_buzz(5)
      expect(@fizzbuzz).to eq('buzz')
    end

    it 'When N is divisible by 3 and 5, returns fizzbuzz' do
      @fizzbuzz = solver.fizz_buzz(15)
      expect(@fizzbuzz).to eq('fizzbuzz')
    end

    it 'Any other case, return N as a string' do
      @fizzbuzz = solver.fizz_buzz(4)
      expect(@fizzbuzz).to eq('4')
    end
  end
end
