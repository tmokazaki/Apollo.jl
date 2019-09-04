import Base.convert

convert(::Type{Int}, v::SubString{String}) = parse(Int, v)
convert(::Type{Float64}, v::SubString{String}) = parse(Float64, v)