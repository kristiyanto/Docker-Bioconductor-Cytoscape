FROM bioconductor/devel_base
MAINTAINER danielkr@uw.edu 

RUN apt-get update
RUN sudo apt-get -q -y install default-jdk
RUN apt-get clean
WORKDIR /root 
#ADD Cytoscape_3_2_1_unix.sh /root/Cytoscape_3_2_1_unix.sh
ADD cytoscape-3.2.1.tar.gz /root/cytoscape-3.2.1.tar.gz
#RUN CP /root/cytoscape-3.2.1.tar.gz/* /usr/local/lib/.
#RUN chmod 755 Cytoscape_3_2_1_unix.sh
CMD ["bash"]
