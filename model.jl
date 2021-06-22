#!/usr/local/bin/julia

println("preparing model...")

#=
  tuple format: (kernel_size, num_filters, stride, padding)
=#
YOLO_conv = [
               (7,64,2,3),
               "M",
               (3,192,1,1),
               "M",
               (1,128,1,0),
               (3,256,1,1),
               (1,256,1,0),
               (3,512,1,1),
               "M",
               #List: (tuple,..., repeat vaue)
               [(1,256,1,0), (3,512,1,1), 4],
               (1,512,1,0),
               (3,1024,1,1),
               "M",
               [(1,512,1,0), (3,1042,1,1), 2],
               (3,1024,1,1),
               (3,1024,2,1),
               (3,1024,1,1),
               (3,1024,1,1),
              ]

println("YOLO conv layers: ", YOLO_conv)


