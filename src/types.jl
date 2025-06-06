# https://github.com/JuliaGeo/CommonDataModel.jl/blob/main/src/types.jl

abstract type AbstractModel end
abstract type AbstractProject <: AbstractModel end
abstract type AbstractInstrument <: AbstractModel end
abstract type AbstractProduct <: AbstractModel end
abstract type AbstractDataSet <: AbstractProduct end

"""
    Project <: AbstractProject

A representation of a project or mission containing instruments and datasets.

# Fields
- `name`: The name of the project
- `metadata`: Additional metadata
- `instruments`: Collection of instruments
- `datasets`: Collection of datasets
"""
mutable struct Project <: AbstractProject
    name::String
    metadata::Dict
    instruments::Dict
    datasets::Dict
end

"keyword-based constructor"
function Project(; name="", instruments=Dict(), datasets=Dict(), metadata=SDict(), kwargs...)
    Project(name, compat_dict(metadata, kwargs), instruments, datasets)
end

"""
    Instrument <: AbstractInstrument

# Fields
- `name`: The name of the instrument
- `metadata`: Additional metadata
- `datasets`: Collection of datasets
"""
struct Instrument <: AbstractInstrument
    name::String
    metadata::Dict
    datasets::Dict
end

"keyword-based constructor"
function Instrument(; name="", metadata=SDict(), datasets=Dict(), kwargs...)
    Instrument(name, compat_dict(metadata, kwargs), datasets)
end

"Construct an `Instrument` from a dictionary."
Instrument(d::Dict) = Instrument(; symbolify(d)...)

Base.insert!(p::Project, i, v::AbstractInstrument) = (p.instruments[i] = v; p)
Base.insert!(p::Union{Project,Instrument}, i, v::AbstractDataSet) = (p.datasets[i] = v; p)
Base.push!(p::Union{Project,Instrument}, v) = insert!(p, name(v), v)
Base.get(var::AbstractModel, s, d=nothing) = get(meta(var), s, d)
Base.get(f::Function, var::AbstractModel, s) = get(f, meta(var), s)

# https://github.com/rafaqz/DimensionalData.jl/blob/main/src/array/show.jl

Base.show(io::IO, p::T) where {T<:AbstractModel} = print(io, name(p))
