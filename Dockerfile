FROM ubuntu
# Basic packages
RUN apt-get update && apt-get install -y curl

# python
RUN apt-get install -y python python-pip python-dev git

# FSL
RUN curl -L http://neuro.debian.net/lists/trusty.us-tn.full > /etc/apt/sources.list.d/neurodebian.sources.list && \
    apt-key adv --recv-keys --keyserver hkp://pgp.mit.edu:80 0xA5D32F012649A5A9 && \
    apt-get update && apt-get install -y fsl-5.0-complete

# AFNI
RUN curl -L https://afni.nimh.nih.gov/pub/dist/tgz/linux_openmp_64.tgz \
    | tar zxC /usr/local && \
    mv /usr/local/linux_openmp_64 /usr/local/afni
RUN apt-get install -y libxp6 gsl-bin
ENV PATH $PATH:/usr/local/afni

# Freesurfer
RUN curl -L ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/5.3.0/freesurfer-Linux-centos6_x86_64-stable-pub-v5.3.0.tar.gz \
    | tar zxC /usr/local
ENV FREESURFER_HOME /usr/local/freesurfer
ENV PATH $PATH:/usr/local/freesurfer/bin
RUN echo -e "bgross@mcw.edu\n3526\n*CyykqDk3ym5g\nFSxiivoYY/SZY" > $FREESURFER_HOME/license.txt

# neural
RUN pip install git+https://github.com/azraq27/neural.git \
                git+https://github.com/azraq27/padre.git


# padre config:
ENV PADRE_ROOT /padre
VOLUME ${PADRE_ROOT}
RUN useradd -m -u 4144 bgross
USER bgross
