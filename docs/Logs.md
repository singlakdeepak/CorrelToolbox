# Logs Date-Wise

## 10-08-2017: Atlas Problem
* Calculating the info about the atlases, I found that I need to ensure that all the variables in matlab are in **double** format. Otherwise, you'll get the wrong answers. 
* The BrainNetome 2mm atlas gets overlayed on MNI space and they have same dimensions also. It can be checked by fsleyes. 
* If the data is given in 3mm format and while you are having the atlas in 2mm, then get the Transformation matrix by registering the subjects on **MNI152_T1_2mm_brain.nii.gz** with nearest neighbor interpolation ensured and then multiply the ROIs with the transformation matrix in order to get the ROI atlas in 3mm. Otherwise, you can straightaway work with atlas of 3mm.

## 22-08-2017: ATLAS Software problem
I had been given the task to use [Ankita Mam's toolbox](https://github.com/Ank0905/funcConn) for the correlations between the voxels. For compiling it, I required ATLAS software for optimizing the operations and getting the correlations faster. But it didn't work and showed the absence of some .so files. This consumed a lot of time but I later on starting working on the toolkit without the optimized versions. So, I needed OpenBLAS, LAPACK and OpenMP. I also had to made some changes in the MakeFile of the toolkit. The new MakeFile is : 
```
all: fconn.cpp
        g++ -L /usr/lib/OpenBLAS/lib \
        -I /usr/lib/OpenBLAS/include -I . \
        -std=c++11 -Wno-deprecated-declarations  fconn.cpp \
        -o fconn.o -lopenblas -llapack -fopenmp                                                      
```
To test on some functional image, type: ` ./fconn.o -i <INPUT> -o <OUTPUTDIR will be formed> -a 1`.

I also tested its performance by `perf` tool of Linux. For the current input, it showed:
```
     506706.508340      task-clock (msec)         #    1.039 CPUs utilized          
         12,34,059      context-switches          #    0.002 M/sec                  
             4,650      cpu-migrations            #    0.009 K/sec                  
         25,37,734      page-faults               #    0.005 M/sec                  
17,56,70,95,84,390      cycles                    #    3.467 GHz                    
12,06,75,48,96,563      instructions              #    0.69  insn per cycle         
   95,87,57,90,941      branches                  #  189.214 M/sec                  
      29,53,59,245      branch-misses             #    0.31% of all branches        

     487.754769540 seconds time elapsed
```

