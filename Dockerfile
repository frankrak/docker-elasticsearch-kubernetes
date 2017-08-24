FROM quay.io/pires/docker-elasticsearch:5.5.2

MAINTAINER pjpires@gmail.com

# upgrade vm.max_map_count to minimum of 262144
run 
  if [ "$mapmax" -lt "262144" ]; then  \
    sysctl -w vm.max_map_count=262144 \
  fi

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false
