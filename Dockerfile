FROM bioconductor/release_base

MAINTAINER Daniel Kristiyanto, danielkr@uw.edu 

RUN apt-get update
RUN sudo apt-get -q -y install default-jdk
RUN apt-get clean
WORKDIR /root 
ADD http://chianti.ucsd.edu/cytoscape-3.2.1/cytoscape-3.2.1.tar.gz /root/cytoscape-3.2.1.tar.gz
RUN tar -zxvf cytoscape-3.2.1.tar.gz 
ADD http://webdatascience.github.io/CyNetworkBMA/timeSeries.txt /root/timeSeries.txt
RUN rm /root/cytoscape-3.2.1.tar.gz
RUN echo 'install.packages(c("Rserve", "igraph"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \     && Rscript /tmp/packages.R
RUN echo 'source("https://bioconductor.org/biocLite.R")' > /tmp/biopackages.R  
RUN echo 'biocLite("networkBMA")' > /tmp/biopackages.R
RUN echo 'library("Rserve")' > /tmp/biopackages.R 
RUN echo 'Rserve()' > /tmp/biopackages.R  \  && Rscript /tmp/biopackages.R

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
CMD ["~/cytoscape-unix-3.2.1/cytoscape.sh"]
