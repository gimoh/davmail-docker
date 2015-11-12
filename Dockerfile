# davmail service
#
# This Dockerfile will build a davmail docker image

FROM ubuntu:12.04
MAINTAINER BK Box "bk@theboxes.org"

RUN           apt-get update
RUN           apt-get install -y default-jre wget
RUN           apt-get clean
RUN           mkdir /usr/local/davmail
RUN           wget -qO - http://downloads.sourceforge.net/project/davmail/davmail/4.6.2/davmail-linux-x86_64-4.6.2-2377.tgz | tar -C /usr/local/davmail --strip-components=1 -xvz
ADD docker-davmail-init.sh /usr/local/davmail/

# Cleanup for a smaller image
RUN apt-get clean
RUN rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/*

#VOLUME        /etc/davmail
EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail
ENTRYPOINT    ["/usr/local/davmail/docker-davmail-init.sh"]
CMD           []
