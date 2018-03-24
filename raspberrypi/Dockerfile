FROM resin/raspberrypi3-python:3.6 

RUN apt-get update
RUN apt-get install -y libgmp-dev

RUN mkdir /ethereum
WORKDIR /ethereum
RUN git clone https://github.com/ethereum/viper.git
RUN git clone https://github.com/linyize/tinyrpc.git
RUN git clone https://github.com/linyize/pyethereum.git --branch feature-pos &&\
    cd pyethereum && git submodule update --init casper
RUN git clone https://github.com/linyize/pyethapp.git --branch feature-pos
RUN cd viper && git reset --hard 9be3ac1945ab98c932ec769274965e9bb0536bb2 && python setup.py develop
RUN cd pyethapp && python setup.py develop
RUN cd pyethereum/casper && git checkout feature-pos
RUN cd pyethereum && python setup.py develop
RUN cd tinyrpc && python setup.py develop

RUN git clone https://github.com/linyize/pydevp2p.git --branch feature-pos
RUN cd pydevp2p && python setup.py develop
#RUN cd pyethapp && git pull

EXPOSE 30303
EXPOSE 30303/udp
EXPOSE 8545

RUN mkdir -p /root/.config/pyethapp/
RUN mkdir /root/log
COPY data/config/*  /root/.config/pyethapp/

#ENTRYPOINT ["sh","/root/start.sh"]
CMD ["pyethapp", "-m", "0", "--password", "/root/.config/pyethapp/password.txt", "-l", "eth.chain:info,eth.chainservice:info,eth.validator:info", "--log-file", "/root/log/log.txt", "-b", "enode://d3260a710a752b926bb3328ebe29bfb568e4fb3b4c7ff59450738661113fb21f5efbdf42904c706a9f152275890840345a5bc990745919eeb2dfc2c481d778ee@106.75.123.234:30303", "run"]
