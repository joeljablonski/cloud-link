FROM amazon/aws-cli:2.5.8

RUN sh

# run update
RUN yum -y update

# install on seperate lines for caching
RUN yum install -y gzip
RUN yum install -y nano
RUN yum install -y tar
RUN yum install -y git
RUN yum install -y unzip
RUN yum install -y wget
RUN yum install -y make
RUN yum install -y procps
RUN yum install -y curl
RUN yum install -y gcc
RUN yum install -y perl-core
RUN yum install -y pcre-devel
RUN yum install -y zlib-devel

# # install openssl 3.0.2
RUN wget https://ftp.openssl.org/source/openssl-3.0.2.tar.gz -P /tmp/
RUN tar -xzvf /tmp/openssl-3.0.2.tar.gz -C /tmp
RUN chmod +x /tmp/openssl-3.0.2/config & /tmp/openssl-3.0.2/Configure
RUN cd openssl-3.0.2 & make & make test & make install
RUN ldconfig /usr/local/lib64/

# install kubectl v1.22.8 (latest v1.22 at time)
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.8/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# install terraform 1.1.9 (latest at time)
RUN curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip
RUN unzip /tmp/terraform.zip
RUN chmod +x terraform && mv terraform /usr/local/bin/

# install helm 3
RUN curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

RUN yum install -y jq

# install terragrunt v0.36.9 (latest at time)
RUN curl -o /tmp/terragrunt -LO https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.9/terragrunt_linux_amd64
RUN chmod +x /tmp/terragrunt && mv /tmp/terragrunt /usr/local/bin/terragrunt

ENTRYPOINT [ "sh" ]