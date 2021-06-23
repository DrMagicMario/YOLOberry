#!/usr/local/bin/julia

println("setting up...")
using Pkg; Pkg.activate(".");
Pkg.add(["Flux"]); Pkg.build();
println("done...")
