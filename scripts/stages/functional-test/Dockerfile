FROM registry-ice.ng.bluemix.net/et_demo_org/ice-pipeline-demo

RUN apt-get update \
&& apt-get install -y vim openssh-server supervisor

RUN mkdir -p /var/log/supervisor
COPY scripts/stages/functional-test/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /var/run/sshd
COPY id_rsa.pub /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
EXPOSE 22

RUN cd /hellonode && npm install
RUN cd /hellonode && npm install -g grunt-cli
RUN cd /hellonode && npm install -g node-inspector
EXPOSE 5858 8090

CMD ["/usr/bin/supervisord"]
