#!/usr/local/bin/julia

println("setting up...")
using Pkg; Pkg.activate(".");
#Pkg.add(["Flux"]); Pkg.build();
Pkg.add(["ImageView","ObjectDetector","FileIO", "ImageIO", "ImageMagick", "QuartzImageIO"]); Pkg.build();
println("done...")
