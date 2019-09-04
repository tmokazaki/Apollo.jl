module BooksController
  # Build something great

using Genie.Renderer

struct Book
  title::String
  author::String
end

const BillGatesBooks = Book[
  Book("The Best We Could Do", "Thi Bui"),
  Book("Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
  Book("Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
  Book("The Sympathizer", "Viet Thanh Nguyen"),
  Book("Energy and Civilization, A History", "Vaclav Smil")
]

export billgatesbooks, billgatesbooks_md

function billgatesbooks()
    html(:books, :billgatesbooks, layout = :admin, books = BillGatesBooks)
end

function billgatesbooks_md()
    html(:books, "billgatesbooks.jl.md", books = BillGatesBooks)
end

module API

using BooksController
import JSON

export billgatesbooks

function billgatesbooks()
  JSON.json(BooksController.BillGatesBooks)
end

end

end
