#!/usr/bin/env bash
set -e

for f in */*.Dockerfile; do
  basename=$(basename ${f})
  tag="kleijnweb/$(dirname ${f}):${basename%.*}"
  docker build --squash php -f ${f} -t ${tag}
  docker push ${tag}
done
