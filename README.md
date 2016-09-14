# neuro_analysis
Dockerfile for building the neuro_analysis2 docker container

Contains a ready-to-analyze Ubuntu container with common neuroimaging tools, including:
* FSL
* AFNI
* Freesurfer
* Custom Python scripts

The script I use to launch commands is:

    #!/bin/bash
   
    sudo -E docker run -v ${PADRE_ROOT}:/padre -v `pwd`:/working -w /working -ti bgross27/neuro_analysis2 $*

---

`padre` is a Python fMRI data organization library I wrote: http://github.com/azraq27/padre

`neural` is a Python fMRI analysis library: http://github.com/azraq27/neural
