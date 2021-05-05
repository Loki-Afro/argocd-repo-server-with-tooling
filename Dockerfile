FROM argoproj/argocd:v2.0.0

USER root

RUN apt-get update \
 && apt-get install -y git-crypt \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /usr/bin/git /usr/bin/git.bin
COPY git /usr/bin/git
COPY --from=builder qbec jsonnet-qbec /usr/bin/

USER argocd
