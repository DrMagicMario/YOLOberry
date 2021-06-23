#!/usr/local/bin/julia

using Pkg
Pkg.activate("."); Pkg.instantiate();

using Flux
println("predicting.....")
