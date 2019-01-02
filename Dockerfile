FROM alpine:latest

RUN apk --no-cache add jq python3 py-pip curl git  \
&& rm -rf /var/cache/apk/* \
&& pip3 install --no-cache-dir --upgrade pip && pip3 install --no-cache-dir awscli

# Install Terraform - we need to match Terraform versions
RUN wget --quiet https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip \
&& unzip terraform_0.11.10_linux_amd64.zip \
&& mv terraform /usr/bin \
&& rm terraform_0.11.10_linux_amd64.zip

# Install Terragrunt
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.17.3/terragrunt_linux_amd64
RUN mv terragrunt_linux_amd64 terragrunt
RUN chmod a+x terragrunt
RUN mv terragrunt /usr/local/bin/
