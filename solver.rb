class Solver

    def factorial(number)
        return 'Can not have factorial of a negative number' if number.negative?
        return 1 if number == 0
        number * factorial(number - 1)
    end
end

checker = Solver.new
puts checker.factorial(-1)