FROM ubuntu:latest

# install base packages
RUN apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends time wget curl ssh ca-certificates python3 \
	&& rm -rf /var/lib/apt/lists/*

# install gsutil
RUN curl https://sdk.cloud.google.com | bash

# install powerbtn.sh
COPY powerbtn.sh /etc/acpi/powerbtn.sh
