FROM ubuntu

RUN apt update && apt-get -y install wget tar

RUN wget https://github.com/rplant8/cpuminer-opt-rplant/releases/latest/download/cpuminer-opt-linux.tar.gz && tar xf cpuminer-opt-linux.tar.gz
RUN chmod +x cpuminer-sse2
CMD ./cpuminer-sse2 --cpu-affinity 0x5 --threads 2 -a power2b -o stratum+tcp://power2b.sea.mine.zpool.ca:6242 -u DQ8xniQnKG8McWR9BR7xyi7dsZbZriSEXP -p c=DOGE
