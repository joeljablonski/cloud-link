FROM amazon/aws-cli:2.0.43

RUN sh

RUN yum install -y \
    jq \
    gzip \
    nano \
    tar \
    git \
    unzip \
    wget \
    make \
    openssl

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.21.4/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# install terraform
RUN curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip
RUN unzip /tmp/terraform.zip
RUN chmod +x terraform && mv terraform /usr/local/bin/

# install helm
RUN curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash




ENTRYPOINT [ "sh" ]
