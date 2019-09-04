module Apollo

using Genie, Genie.Router, Genie.Renderer, Genie.AppServer

function main()
  Base.eval(Main, :(const UserApp = Apollo))

  include(joinpath("..", "genie.jl"))

  Base.eval(Main, :(const Genie = Apollo.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end
