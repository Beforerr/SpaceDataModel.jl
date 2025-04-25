module SpaceDataModel
using Accessors: @set
import Base: size, ∘
import Base: push!, insert!, get, show

export AbstractModel, AbstractProject, AbstractInstrument, AbstractProduct, AbstractDataSet, AbstractCatalog, AbstractEvent
export AbstractDataVariable
export Project, Instrument, DataSet, LDataSet, Product
export Event
export abbr

# Interface
name(v) = _getfield(v, :name)
meta(v) = _getfield(v, (:meta, :metadata))
units(v) = @get(v, "units", nothing)
times(v) = _getfield(v, (:times, :time))

include("utils.jl")
include("types.jl")
include("dataset.jl")
include("product.jl")
include("variable.jl")
include("catalog.jl")
include("methods.jl")
include("timerange.jl")

end
