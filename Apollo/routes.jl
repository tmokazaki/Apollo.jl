using Genie.Router, Genie.Renderer, Genie.Requests
using Plots
using BooksController
plotly()

route("/") do
  serve_static_file("welcome.html")
end

route("/hello") do
  "Hello World!"
end

route("/billgates", BooksController.billgatesbooks)

route("/billgates_md", BooksController.billgatesbooks_md)

route("/api/v1/bgbooks", BooksController.API.billgatesbooks)

route("/echo", method = POST) do
  message = jsonpayload()
  (:echo => (message["message"] * " ") ^ message["repeat"]) |> json
end

route("/sum", method = POST) do
  message = jsonpayload()
  (:sum => sum(message["data"])) |> json
end


route("/plot") do
  a = rand(10, 3)
  f = tempname()
  plot(a)
  Plots.html("$f.html")
  open("$f.html") do stream
      readlines(stream)
  end
end
route("/error500") do
  error_500("Something went wrong")
end

route("/error404") do
  error_404("the page you want")
end
