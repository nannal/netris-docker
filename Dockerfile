FROM debian
RUN apt-get update -y && apt-get install openssh-server wget -y 
RUN mkdir netris
WORKDIR ./netris
RUN wget https://netris.rocketnine.space/download/0.1.3/netris_0.1.3_linux_amd64.tar.gz
RUN tar xfvz ./n*
CMD ssh-keygen -f ~/.ssh/id_rsa -P '' && ./netris-server --listen-ssh 0.0.0.0:4096 --listen-tcp 0.0.0.0:2048 -netris ./netris --verbose
