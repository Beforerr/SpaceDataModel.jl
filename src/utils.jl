symbolify(d::Dict) = Dict{Symbol,Any}(Symbol(k) => v for (k, v) in d)

function format_pattern(pattern; kwargs...)
    pairs = ("{$k}" => v for (k, v) in kwargs)
    return replace(pattern, pairs...)
end

function rename!(d::Dict, old_key, new_key)
    data = pop!(d, old_key, nothing)

    if !isnothing(data)
        d[new_key] = data
    end
end

function rename!(d::Dict, old_keys::Union{Tuple,Vector}, new_key)
    for old_key in old_keys
        rename!(d, old_key, new_key)
    end
end

function set!(d::Dict, args::Pair...; kwargs...)
    foreach(args) do (k, v)
        d[k] = v
    end
    merge!(d, kwargs)
end

function set(d::Dict, args::Pair...; kwargs...)
    return merge(d, Dict(args...), kwargs)
end

# https://github.com/rafaqz/DimensionalData.jl/blob/main/src/Dimensions/show.jl#L5
function colors(i)
    colors = [209, 32, 81, 204, 249, 166, 37]
    c = rem(i - 1, length(colors)) + 1
    colors[c]
end

print_name(io::IO, var) = printstyled(io, name(var); color=colors(7))