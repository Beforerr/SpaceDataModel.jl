# SpaceDataModel

[![Build Status](https://github.com/Beforerr/SpaceDataModel.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Beforerr/SpaceDataModel.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Overview

SpaceDataModel.jl is a lightweight Julia package providing a flexible data model for handling space/heliospheric science data. It offers abstractions for organizing space data into hierarchical structures including projects, instruments, datasets, and data variables.

It is used in [SPEDAS.jl](https://github.com/Beforerr/SPEDAS.jl) and [Speasy.jl](https://github.com/SciQLop/Speasy.jl).

## Installation

Using Julia's package manager:

```julia
using Pkg
Pkg.add("SpaceDataModel")
```

## Features

- Hierarchical organization of data (projects, instruments, datasets)
- Pretty printing for data inspection

## Reference

- [SPASE Model](https://spase-group.org/data/model/index.html)
- [HAPI Data Access Specification](https://github.com/hapi-server/data-specification)