FROM ubuntu:16.04
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

COPY sources.list /etc/apt/

# Install system dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common vim git iputils-ping
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update 
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y solc build-essential python-minimal aptitude curl \
    libssl-dev automake pkg-config libtool libffi-dev libgmp-dev
RUN apt-get install -y python3.6 python3.6-dev python3-pip python3.6-venv

RUN mkdir -p ~/.pip/
COPY pip.conf ~/.pip/pip.conf

# Install Python dependencies
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel
RUN ln -sf /usr/local/bin/pip3.6 /usr/local/bin/pip \
    && ln -sf /usr/bin/python3.6 /usr/local/bin/python \
    && pip install -U pip
RUN pip install coincurve==6.0.0 web3

# Clone and install (editable) required repositories
WORKDIR /ethereum
RUN git clone https://github.com/ethereum/vyper.git
RUN git clone https://github.com/linyize/tinyrpc.git
RUN git clone https://github.com/linyize/pyethereum.git --branch feature-pos &&\
    cd pyethereum && git submodule update --init casper
RUN git clone https://github.com/linyize/pyethapp.git --branch feature-pos
RUN cd pyethereum/casper && git checkout feature-pos
RUN git clone https://github.com/linyize/pydevp2p.git --branch feature-pos

# Download the filebeat package and install 
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.1.0-amd64.deb
RUN dpkg -i filebeat-6.1.0-amd64.deb

# config miner node
COPY default_data/config /root/.config/pyethapp
COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml
COPY default_data/log /root/log
COPY start.sh /root/

RUN cd pydevp2p && git pull
RUN cd pyethereum/casper && git pull
RUN cd pyethereum && git pull
RUN cd pyethapp && git pull
RUN cd vyper && git checkout v0.0.4
RUN cd pyethapp && python setup.py develop
RUN cd pyethereum && python setup.py develop
RUN cd pyethereum/casper && python setup.py develop
RUN cd tinyrpc && python setup.py develop
RUN cd pydevp2p && python setup.py develop
RUN cd vyper && python setup.py develop
RUN rm -rf /usr/local/lib/python3.6/dist-packages/devp2p-*
RUN rm -rf /usr/local/lib/python3.6/dist-packages/ethereum-*
RUN rm -rf /usr/local/lib/python3.6/dist-packages/pyethapp-*
RUN rm -rf /usr/local/lib/python3.6/dist-packages/tinyrpc-*
RUN rm -rf /usr/local/lib/python3.6/dist-packages/vyper-*

EXPOSE 30303
EXPOSE 30303/udp
EXPOSE 8545

ENTRYPOINT ["sh","/root/start.sh"]
