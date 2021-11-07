FROM python:3.8-buster

# Avoid warnings by switching to noninteractive
ENV POETRY_VERSION=1.0.0 \
    CLOUD_SDK_VERSION=277.0.0 \
    TERRAFORM_VERSION=0.15.0 \
    HELM_VERSION=3.2.0 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    DEBIAN_FRONTEND=noninteractive
    
# gcloud sdk 
ENV PATH /google-cloud-sdk/bin:$PATH
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check false && \
    gcloud components install kubectl && \
    gcloud components install beta

# install terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/bin \
    # Clean up
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/tmp/*

# install packages
RUN python3 -m pip install --upgrade pip \
    jinja2 --upgrade \
    yq --upgrade \
    pre-commit --upgrade \
    direnv --upgrade \
    yamllint --upgrade 

# install tfenv as per the VM gs://vf-grp-neuronenabler-nonlive-dev-vm-scripts/post_setup_neuron.sh
RUN git clone https://github.com/tfutils/tfenv.git /root/.tfenv
ENV PATH="/root/.tfenv/bin:${PATH}"

# install pyenv as per the VM gs://vf-grp-neuronenabler-nonlive-dev-vm-scripts/post_setup_neuron.sh
RUN git clone https://github.com/pyenv/pyenv.git /root/.pyenv
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PATH}"

# setting up poetry packages
WORKDIR /setup/
# COPY poetry.lock* pyproject.toml ./
ENV PATH="/poetry/bin:${PATH}"

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1 \
    && apt-get -y install \
    git \
    jq \
    procps \
    lsb-release \
    gettext-base \
    man-db \
    ruby \
    ruby2.5-dev \
    vim \
    less \
    zsh \
    # install poetry
    && pip install "poetry==$POETRY_VERSION" \
    # && poetry config settings.virtualenvs.create false \
    # && if [ -f "pyproject.toml" ]; then poetry install --no-interaction --no-ansi; fi \
    && rm -rf /setup \
    # Clean up
    && apt-get autoremove -y
# && apt-get clean -y \
# && rm -rf /var/lib/apt/lists/*
RUN gem install bundler || true
RUN bundle install || true
# get that oh-my-zsh
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ENV KUSTOMIZE_SCRIPT="https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" 
# RUN cd /usr/local/bin \
#     && curl -s "$KUSTOMIZE_SCRIPT" | bash

# ENV HELM_RELEASE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"
# RUN wget --quiet https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
#     && tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
#     && mv linux-amd64/helm /usr/local/bin/helm \
#     && rm -rf linux-amd64 helm-v${HELM_VERSION}-linux-amd64.tar.gz

# RUN helm plugin install https://github.com/databus23/helm-diff --version master
# RUN wget --quiet https://github.com/roboll/helmfile/releases/download/v0.120.0/helmfile_linux_amd64  -O /usr/local/bin/helmfile \
#     && chmod +x /usr/local/bin/helmfile

# ENV GO_VERSION="1.14.4"
# RUN curl -L -o /tmp/go${GO_VERSION}.linux-amd64.tar.gz https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
#     cd /usr/local && tar -xzvf /tmp/go${GO_VERSION}.linux-amd64.tar.gz && rm -rf /tmp/go${GO_VERSION}.linux-amd64.tar.gz && \
#     echo -n 'export PATH=$PATH:/usr/local/go/bin' >> /etc/bash.bashrc

# VOLUME ["/neuron-gcp-platform", ["/root/.config"]
WORKDIR /neuron-gcp-platform

CMD /bin/bash
