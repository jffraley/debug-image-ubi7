FROM registry.access.redhat.com/ubi7/ubi

LABEL maintainer="John Fraley jffraley@us.ibm.com"
LABEL description="Simple container with some useful tools for DB2ing.  Shuts down after 8 hours."

# Install the applications we want
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN yum update -y
RUN yum install -y nc curl wget iputils traceroute bind-utils net-tools vi zip unzip telnet rsync which openssh-clients java-1.8.0-openjdk && \
    rm -rf /var/lib/apt/lists/*
RUN yum install -y wireshark mtr tcpdump nmap iproute
RUN yum install -y postgresql
RUN yum install -y terraform

### install openshift CLI ###
RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
RUN ibmcloud plugin install container-service
RUN ibmcloud plugin install container-registry

### install homebrew ###
#RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


COPY docker/. /root/.
WORKDIR /root/

CMD ["/bin/sleep", "8h"]
#CMD tail -f /dev/null
