FROM quay.io/toolbx-images/alpine-toolbox:edge

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="alpine with nix on it" \
      maintainer="dnkmmr69420"
      
RUN   apk update && \
      apk upgrade && \
      apk add xz curl wget

RUN   ln -sf /bin/sh /usr/bin/sh && \
      ln -sf /bin/bash /usr/bin/bash
      
RUN   wget -P /opt https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix-check && \
      chmod a+x /opt/nix-check
      
ENTRYPOINT  /opt/nix-check
