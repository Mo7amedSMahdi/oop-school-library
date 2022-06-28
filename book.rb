require './rental'

class Book
  attr_accessor :title, :author, :id
  attr_reader :rentals

  def initialize(title:, author:, id:)
    @id = id.zero? ? Random.rand(1..1000) : id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
