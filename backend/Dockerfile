ARG SPIFFWORKFLOW_BACKEND_TAG=${SPIFFWORKFLOW_BACKEND_TAG}
FROM ghcr.io/sartography/spiffworkflow-backend:${SPIFFWORKFLOW_BACKEND_TAG}

RUN apt-get update \
  && apt-get install -y -q libpq-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
