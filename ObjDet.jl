#!/usr/local/bin/julia

using Pkg
Pkg.activate("."); Pkg.instantiate();
using ObjectDetector, FileIO, ImageView


println("predicting.....")

yolomod = YOLO.v3_608_COCO(batch=1, silent=true) # Load the YOLOv3-tiny model pretrained on COCO, with a batch size of 1

batch = emptybatch(yolomod) # Create a batch object. Automatically uses the GPU if available

img = load(joinpath(dirname(dirname(pathof(ObjectDetector))),"test","images","dog-cycle-car.png"))

batch[:,:,:,1], padding = prepareImage(img, yolomod) # Send resized image to the batch

res = yolomod(batch, detectThresh=0.5, overlapThresh=0.8) # Run the model on the length-1 batch

imgBoxes = drawBoxes(img, yolomod, padding, res)
imshow(imgBoxes)
save("result.png", imgBoxes)
println("Done")

#=
println("benchmarking....")
ObjectDetector.benchmark()
println("done benchmarking")
=#

while (true)
	sleep(1)
end

