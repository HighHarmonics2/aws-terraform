FROM alpine:latest

RUN apk --no-cache add jq python3 py-pip curl git terraform \
&& rm -rf /var/cache/apk/* \
&& pip3 install --no-cache-dir --upgrade pip && pip3 install --no-cache-dir awscli

# Install Terragrunt
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.17.3/terragrunt_linux_amd64
RUN mv terragrunt_linux_amd64 terragrunt
RUN chmod a+x terragrunt
RUN mv terragrunt /usr/local/bin/
