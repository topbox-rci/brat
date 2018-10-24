FROM ubuntu

RUN apt-get update
RUN apt-get install -y vim sudo python3.6 curl unzip python3-filelock

RUN useradd -ms /bin/bash brat

RUN mkdir -p /opt/brat
#RUN curl -L -o /root/master.zip https://github.com/nlplab/brat/archive/master.zip \
#    && cd /opt/brat \
#    && unzip /root/master.zip \
#    && mv /opt/brat/brat-master/* /opt/brat \
#    && rm -rf /opt/brat/brat-master \
#    && rm /root/master.zip

# RUN mkdir /opt/brat/data /opt/brat/work \
#     && chown -R brat /opt/brat

# COPY config.py /opt/brat/config.py
# RUN chown brat /opt/brat/config.py

# VOLUME [ '/opt/brat/data', '/opt/brat/work' ]

VOLUME [ '/opt/brat' ]

USER brat

WORKDIR /opt/brat

EXPOSE 8001/tcp

ENTRYPOINT [ "python3.6", "standalone.py" ]
