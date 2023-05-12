FROM quay.io/toolbx-images/alpine-toolbox:edge

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="alpine with nix on it" \
      maintainer="dnkmmr69420"
      
RUN apk add xz
